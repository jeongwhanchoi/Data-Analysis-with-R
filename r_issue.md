# R Console Issue

## LOCALE ERROR

The errors on **Mac Sierra** are:

```
During startup - Warning messages:
1: Setting LC_CTYPE failed, using "C"
2: Setting LC_COLLATE failed, using "C"
3: Setting LC_TIME failed, using "C"
4: Setting LC_MESSAGES failed, using "C"
5: Setting LC_PAPER failed, using "C"
```

**Solve:**

1. Open Terminal

2. Write or paste in:

   `defaults write org.R-project.R force.LANG en_US.UTF-8`

3. Close Terminal

4. Start R

Reference: [StackOverflow](https://stackoverflow.com/questions/9689104/installing-r-on-mac-warning-messages-setting-lc-ctype-failed-using-c)

**Check:**

```R
> Sys.getlocale()
[1] "en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8"
> print("안녕")
[1] "안녕"
> print("hello")
[1] "hello"
```

> If you want to set your locale to `ko_KR.UTF-8`, write the code below:
>
> `Sys.setlocale('LC_ALL', 'ko_KR.UTF-8')`