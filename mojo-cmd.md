# Modular CLI Installtion
```bash
curl https://get.modular.com | \
  MODULAR_AUTH=mut_80d67bcd10e74e13bdef12eb67fc51dc \
  sh -
  ```

# SDK Installation
  ```bash
  modular install mojo
  ```
## Adding env variable
```bash
echo 'export MODULAR_HOME="$HOME/.modular"' >> ~/.bashrc
echo 'export PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```