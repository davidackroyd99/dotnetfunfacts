from typing import List
from random import randint
import json

outdir = "../json/"

class JsonDoc():
	def __init__(self):
		self.id: int = randint(0, randint(0, 2 ** 20))
		self.fname: str = str(self.id) + ".json"
	
	def serialize(self) -> dict:
		return {
			"id": self.id
		}
	
	def save(self):
		with open(outdir + self.fname, "w") as f:
			f.write(json.dumps(self.serialize()))

class PageDoc(JsonDoc):
	def __init__(self, fpath: str):
		super().__init__()
		self.title: str = ""
		self.tags: List[str] = []
		self.body: str = ""
		self.author: str = ""
	
	def serialize(self) -> dict:
		d = super().serialize()
		d['title'] = self.title
		d['tags'] = self.tags
		d['body'] = self.body
		d['author'] = self.author
		return d

class JsonBuilder():
	def __init__(self):
		self.index_doc = object()
		self.page_docs: List[PageDoc] = []
	
doc = PageDoc("../facts/1-readonly-and-const.md")

doc.title = "hello, world!"

doc.save()