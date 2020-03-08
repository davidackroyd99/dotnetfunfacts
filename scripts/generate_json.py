from typing import List, Dict
from random import randint
from pathlib import Path
import json

OUTDIR = "www_stage/resources/data/"
META = "!meta"
END_META = "!end"

class JsonDoc():
	def __init__(self):
		self.id: int = randint(0, randint(0, 2 ** 20))
		self.fname: str = str(self.id) + ".json"

	def serialize(self) -> dict:
		return {
			"id": self.id
		}

	def save(self) -> None:
		with open(OUTDIR + self.fname, "w") as f:
			f.write(json.dumps(self.serialize()))

class FactDoc(JsonDoc):
	def __init__(self, fpath: str):
		super().__init__()
		raw = self._get_raw_fact(fpath)
		self.metadata: dict = self._get_fact_metadata(raw)
		self.body: str = self._get_fact_body(raw)

	def _get_raw_fact(self, fpath: str) -> str:
		with open(fpath) as f:
			return f.read()

	def _get_fact_metadata(self, fact_data: str) -> dict:
		metadata = {}
		meta_mode = False

		for line in fact_data.splitlines():
			if line == META:
				meta_mode = True
			if line == END_META:
				break
			if meta_mode and ":" in line:
				key, val = "", ""
				# sometimes metadata keys don't have values, but the front end will still probably want them
				# so in these cases we just set the val to an empty string
				# TODO: big method, split up.
				try:
					key, val = line.split(":")
				except ValueError:
					key = line.split(":")[0]
					val = ""

				if key == "tags":
					metadata["tags"] = val.split(";")
				else:
					metadata[key] = val

		return metadata

	def _get_fact_body(self, fact_data: str) -> str:
		return fact_data.split(END_META)[1]

	def serialize_head(self) -> dict:
		d = super().serialize()
		d['metadata'] = self.metadata
		return d

	def serialize(self) -> dict:
		d = self.serialize_head()
		d['body'] = self.body
		return d

class IndexDoc(JsonDoc):
	def __init__(self):
		super().__init__()
		self.fname:str = "index.json"
		self.facts:List[dict] = []

	def add_fact(self, fact: FactDoc):
		self.facts.append(fact.serialize_head())
	
	def serialize(self):
		d = super().serialize()
		d["facts"] = self.facts
		return d

index = IndexDoc()
p = Path("./facts")

for fact_file in [str(path) for path in p.glob("*.md")]:
	doc = FactDoc(fact_file)
	index.add_fact(doc)
	doc.save()

index.save()