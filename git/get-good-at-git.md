# Git
Git is a version control system that allows multiple developers to collaborate on a project. It tracks changes made to files, allows for branching and merging, and provides a complete history of the project. Developers can work on their own copies of the code and merge their changes back into the main codebase. Git also provides mechanisms for resolving conflicts that arise when multiple developers make changes to the same files.
Moreover, there is a thing called **Github** where git is must.
<br> In this page we will discuss about tips and tricks to **Get good at git**.
<br> So, lets get started.
> [!NOTE]
> Here written things are only for terminal users 😎😎😎.
## Combining commit and add
The basic command that all use is `git add .` Then `git commit -m "<msg>"`. But there is a special charecter in a programmer that we can not just write such long things. So, what we can do is:
```bash
git commit -am "<msg>"
```
> [!NOTE]
> Here `<msg>` is you message that you want to type while commiting.
## Custom git command
Well we shorted the git **commit** and **add**.But don't you think this `git commit -am` is not that short. We need to short it more. To do so:
```bash
git config --global alias.<alias_name> "<value>"
```
> [!NOTE]
> Here `<alias_name>` is the short command name and `<value>` is the real full command after `git`.
Let see an example to clear ourselve:
```bash
# We are going to short the cmd: git commit -am "<msg>"
git config --global alias.cmt "commit -am"
# Use
git cmt "cool commit"
```
## Amend
Uh oh! It seems like my last commit message was worng what should I do? <br>
What we are gonna do now:
```bash
git commit --amend -n "<new_msg>"
```
Hmmm it seems ok.But if we want to add some more edit on our last commit what we can do is edit the files then:
```bash
git commit --amend --no-edit
```
## Push force
What if our code is not getting **push** in remote. We just need:
```bash
git push origin master --force
```
> [!NOTE]
> If that does not work that means your code is dashed up.Well do worry there is a solution later on this page.
## Revert
If push complete totally garbage code and then you realize what pushed was full of bulls**t.What you can do is:
```bash
git revert <id>
```
> [!WARNING]
> This will undo to the specific commit id you provided in `<id>`'s place.
## Stash
Let's we want to save our code to work on them later on. What we can do is just run:
- To save
```bash
git stash
# Or to save with specific name
git stash save <name>
```
- To see what we saved
```sh
git stash list
```
- To apply the saved code
```sh
git stash app <id_or_name>
```
## To rename Master Branch
```sh
git branch -M <name>
```
## Log
_The more you play the more messy it will get_- That's the rule that `git log` follows.
upon more commits the log tree gets look more of a s**t. To make it look cooler
```sh
git log --graph --oneline --decorate
```
## Bisect
Bisect stands for binary search. Well it is for debuging your code.You can got and see [them](https://git-scm.com/docs/git-bisect).
## Squash
It is used for adding multiple commit as one and
them push them. Generally, it is used when merging branch in
a single commit.
```sh
git rebase master --interactive
```
## Hooks
Git hooks allow you to run custom scripts in response to certain Git events, such as committing, merging, or pushing changes to a repository. These scripts can be used to enforce coding standards, run tests, or automate other tasks.
To use them [here](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks).
