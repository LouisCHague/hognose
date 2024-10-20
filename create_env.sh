#!/bin/bash

# Check if the directory exists, if not, create it
if [ ! -d "$1" ]; then
  mkdir -p "$1/bin" "$1/lib" "$1/include"
else
  echo "$1 already exists."
  exit 1
fi

# Create the activate.sh script
cat <<EOL > "$1/activate.sh"
#!/bin/bash
export VIRTUAL_ENV="/mnt/c/Users/louis/hognose/$1"
export PATH="\$VIRTUAL_ENV/bin:\$PATH"
export PS1="($1) \$PS1"
EOL

# Create the deactivate.sh script 
# Unsets the virtual env, removes it from $PATH and removes (env)
# NEED TO MAKE IT SO /mnt/c/Users/louis/hognose... is relative to the USER!!!!!
cat <<EOL > "$1/deactivate.sh"
#!/bin/bash
unset VIRTUAL_ENV
export PATH=\$(echo "\$PATH" | sed -e 's|:/mnt/c/Users/louis/hognose/$1/bin||; s|^/mnt/c/Users/louis/hognose/$1/bin:||; s|^/mnt/c/Users/louis/hognose/$1/bin$||')
export PS1=\$(echo "\$PS1" | sed "s|($1) ||")
EOL