const TrieNode = require("./TrieNode");

class Trie {
  constructor() {
    this.root = new TrieNode();
  }

  insert(word) {
    let current = this.root;

    for (const char of word) {
      if (!current.children[char]) {
        current.children[char] = new TrieNode(char);
      }
      current = current.children[char];
    }
    current.isWord = true;
  }
}

module.exports = Trie;
