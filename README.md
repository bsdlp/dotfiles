# dotfiles

### This includes:
* vim
* zsh

### How to use?

To pull in and update the submodules:

* If you are fancy: `git clone --recursive https://github.com/fly/dotfiles.git` to clone this repo and submodules in one go.

* if you aren't fancy: `git submodule init` after you've cloned this repo normally.

To keep them updated: `git submodule update`.

You'll want to have [GNU stow](https://www.gnu.org/software/stow) installed,
which you can do by running `brew install stow` if you have
[homebrew](http://brew.sh) installed (which you should).

Then, just run `bin/stow <target directory>`, and you should be 
golden.


