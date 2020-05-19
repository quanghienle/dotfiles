### Dotfiles
---

**run** ```sh install.sh```


--
## set up clojure-lsp

1. download [clojure-lsp](https://github.com/snoe/clojure-lsp)
2. move it under /usr/local/bin
3. chmod +x /usr/local/bin/clojure-lsp
4. Add to :CocConfig
```json
"languageserver": {
    "clojure-lsp": {
      "command": "bash",
      "args": ["-c", "clojure-lsp"],
      "filetypes": ["clojure"],
      "rootPatterns": ["project.clj"],
      "additionalSchemes": ["jar", "zipfile"],
      "trace.server": "verbose",
      "initializationOptions": {
      }
    }
  }
```
  
