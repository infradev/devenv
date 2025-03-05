# devenv - cloud9

```
git config --global --add user.name "Alexandre Souza" 
git config --global --add user.email "alexandre@infradev.com.br"
git config --global --add core.sshCommand 'ssh -i ~/.ssh/id_ed25519'

cp -rf .* ~/

mkdir -p ~/.local/bin
tar -xvz -C ~/.local/bin -f <(wget -q -O - https://github.com/asdf-vm/asdf/releases/download/v0.16.5/asdf-v0.16.5-linux-amd64.tar.gz)

git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
ln -s ~/.tfenv/bin/* ~/.local/bin

git clone --depth 1 https://github.com/tgenv/tgenv.git ~/.tgenv
ln -s ~/.tgenv/bin/* ~/.local/bin

cat ~/.asdf/.tool-versions | while read line ; do
  echo ">>> $line"
  asdf plugin add $(echo $line | awk '{print $1 " " $3}')
  asdf install $(echo $line | awk '{print $1 " " $2}')
  asdf set --parent $(echo $line | awk '{print $1 " " $2}')
done
```
