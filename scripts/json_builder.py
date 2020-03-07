from typing import List, Dict
from random import randint
import json

OUTDIR = "../json/"
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

class PageDoc(JsonDoc):
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
				key, val = line.split(":")
				
				if key == "tags":
					metadata["tags"] = val.split(";")
				else:
					metadata[key] = val
		
		return metadata
	
	def _get_fact_body(self, fact_data: str) -> str:
		return fact_data.split(END_META)[1]

	def serialize(self) -> dict:
		d = super().serialize()
		d['metadata'] = self.metadata
		d['body'] = self.body
		return d

class JsonBuilder():
	def __init__(self):
		self.index_doc = object()
		self.page_docs: List[PageDoc] = []
	
doc = PageDoc("../facts/1-readonly-and-const.md")
doc.save()