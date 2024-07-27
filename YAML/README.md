# YAML
__Yet another markup language__ or __YAML Aint Markup Language__ is used as same as JASON. It is a serialization language. Here is some basics:
```yaml
# class
server:
   # list
   # key value
   - app: mucro
     version: 2.3
     deployed: true yes no on
   # or
   - app2: "micro \n"
   # multiline
   # use | for multiline
   - app3: |
      this is a multiline one
      with multiple line and the next line and yaml
      use it as it is
     # use > for muitiline to be used as a single line
     info: >
        hello this might
        be multiline but yaml
        see this as a single line
# to write multiple file use `---`
---
server2:
   app: auth
   verson: 3
   # access env variables
   type: $ENV_T
   # placeholder form template
   commit: {{ git.commit.id }}

```
