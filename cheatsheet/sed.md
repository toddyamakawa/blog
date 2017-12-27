
###### Emulates `wc -l`
```bash
sed -n '$='
```

###### Emulates `tac`
```bash
sed '1!G;h;$!d'
sed -n '1!G;h;$p'
```

###### Insert a blank line below `regex`
```bash
 sed '/regex/G'
```

###### Insert a blank line above `regex`
```bash
sed '/regex/{x;p;x;}'
```

###### Delete leading whitespace
```bash
sed 's/^\s*//'
```

###### Delete trailing whitespace
```bash
sed 's/\s*$//'
```

###### Replace `foo` with `bar` on lines that match `baz`
```bash
sed '/baz/s/foo/bar/g'
```

###### Replace `foo` with `bar` on lines that don't match `baz`
```bash
sed '/baz/!s/foo/bar/g'
```
