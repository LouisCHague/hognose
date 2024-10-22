#!/bin/bash

# Location of the Hognose DIR
HOG_DIR=$(dirname "$0")

# Check if the directory exists, if not, create it
if [ ! -d "$1" ]; then
  mkdir -p "$HOG_DIR/envs/$1/bin" "$HOG_DIR/envs/$1/lib" "$HOG_DIR/envs/$1/include"
else
  echo "$1 already exists."
  exit 1
fi

# Create the activate.sh script
cat <<EOL > "$HOG_DIR/envs/$1/activate.sh"
#!/bin/bash
export VIRTUAL_ENV="$HOG_DIR/envs/$1"
export PATH="\$VIRTUAL_ENV/bin:\$PATH"
export PS1="($1) \$PS1"
EOL

# Create the deactivate.sh script 
# Unsets the virtual env, removes it from $PATH and removes (env)
cat <<EOL > "$HOG_DIR/envs/$1/deactivate.sh"
#!/bin/bash
unset VIRTUAL_ENV
export PATH=\$(echo "\$PATH" | sed -e 's|:$HOG_DIR/envs/$1/bin||; s|^$HOG_DIR/envs/$1/bin:||; s|^$HOG_DIR/envs/$1/bin$||')
export PS1=\$(echo "\$PS1" | sed "s|($1) ||")
EOL