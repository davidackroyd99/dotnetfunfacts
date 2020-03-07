from typing import List
from random import randint
import json

outdir = "../www/"

class JsonDoc():
	def __init__(self, fname):
		self.id: int = randint(0, randint(0, 2 ** 20))
		self.fname: str = fname + ".json"
	
	def save(self):
		with open(ooutdir + self.fname) as f:
			f.write(json.dumps(self))

class PageDoc(JsonDoc):
		self.title: str = ""
		self.tags: List[str] = []
		self.body: str = ""
		self.author: str = ""

class JsonBuilder():
	def __init__(self):
		self.index_doc = object()
		self.page_docs: List[PageDoc] = []
	
