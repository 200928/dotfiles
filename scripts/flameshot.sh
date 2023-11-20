#!/bin/bash

#rm -rf /tmp/flameshot.png;flameshot gui -p /tmp/flameshot;echo -e '\003';xclip -i -selection clipboard -target image/png < /tmp/flameshot.png
rm -rf /tmp/flameshot.png && deepin-screenshot -s /tmp/flameshot && xclip -i -selection clipboard -target image/png < /tmp/flameshot.png

# flameshot gui -p /tmp -c -r
# flameshot gui -r -p /tmp -c | xclip -selection clipboard -t image/png
