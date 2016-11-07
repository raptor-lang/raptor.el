# Raptorscript major mode for Emacs
This is a simple raptorscript major mode for Emacs. Currently it only consists of simple syntax highlighting.

## Installation
Because of the nature of raptorscript, I don't currently feel like this should be uploaded to MELPA.
So for now, this is how you would install it
### Plain Emacs
Clone this repo somewhere you can keep it (like `.emacs.d/packages`). Then add the following to your config:
```emacs-lisp
(add-to-list 'load-path "~/.emacs.d/packages/raptor.el/")
(require 'raptor-mode)
```
That should be it!
### Spacemacs
In your `.spacemacs`, add the following to `dotspacemacs-additional-packages`
```emacs-lisp
(raptor-mode :location (recipe
                       :fetcher github
                       :repo "raptor-lang/raptor.el")))
``` 
This will keep the package automatically updated
