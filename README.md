# amusing_git
Brings fun to the git workflow

[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=102)](https://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/amusing_git.svg)](https://badge.fury.io/rb/amusing_git)
![Gem Downloads](https://ruby-gem-downloads-badge.herokuapp.com/amusing_git?type=total)
[![Twitter Follow](https://img.shields.io/twitter/follow/Ajit5ingh.svg?style=social)](https://twitter.com/Ajit5ingh)

### Installation
```bash
gem install amusing_git
```

### Usage
```bash
Commands:
  amusing_git amuse           # Print random message from configured messages, use `amusing_git help amuse` to know how to add your own messages
  amusing_git help [COMMAND]  # Describe available commands or one specific command
  amusing_git setup           # Setup amusing git
  amusing_git start           # Start amusing for the current git repository
  amusing_git stop            # Stop amusing for the current git repository
```

Install the amusing_git gem using the above command. Go to your git repository and type
```bash
amusing_git start
```
After the above command whenever you pull or push the code to remote, amusing_git will amuse you some interesting quotes.
To stop amusing_git for any git repository just type below command.
```bash
amusing_git stop
```

LICENSE
-------

```LICENSE
MIT License

Copyright (c) 2018 Ajit Singh

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
