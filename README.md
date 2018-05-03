### Unix

```sh
git clone https://github.com/brunoyb/dotfiles.git

cd dotfiles

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s "$(pwd)/bash_aliases"      ~/.bash_aliases
ln -s "$(pwd)/bash_completion"   ~/.bash_completion
ln -s "$(pwd)/bash_completion.d" ~/.bash_completion.d
ln -s "$(pwd)/bash_logout"       ~/.bash_logout
ln -s "$(pwd)/bash_profile"      ~/.bash_profile
ln -s "$(pwd)/bashrc"            ~/.bashrc
ln -s "$(pwd)/emacs.d"           ~/.emacs.d
ln -s "$(pwd)/gitconfig"         ~/.gitconfig
ln -s "$(pwd)/git_template"      ~/.git_template
ln -s "$(pwd)/inputrc"           ~/.inputrc
ln -s "$(pwd)/profile"           ~/.profile
ln -s "$(pwd)/vim"               ~/.vim
ln -s "$(pwd)/vimrc"             ~/.vimrc
ln -s "$(pwd)/Xresources"        ~/.Xresources

vim +PlugInstall +qall
```

### Windows

```posh
git clone https://github.com/brunoyb/dotfiles.git

cd dotfiles

"ls '$pwd\powershell_profile.d\*.ps1' | % { . `$_.FullName }" | Out-File -Encoding UTF8 -Append $PROFILE

curl.exe -fLo ~\vimfiles\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cmd /c 'MKLINK /D %USERPROFILE%\.emacs.d      %CD%\emacs.d'
cmd /c 'MKLINK    %USERPROFILE%\.gitconfig    %CD%\gitconfig'
cmd /c 'MKLINK /D %USERPROFILE%\.git_template %CD%\git_template'
cmd /c 'MKLINK /D %USERPROFILE%\vimfiles      %CD%\vim'
cmd /c 'MKLINK    %USERPROFILE%\_vimrc        %CD%\vimrc'

# New-Item -ItemType SymbolicLink -Path ~\.emacs.d      -Target "$(pwd)\emacs.d"
# New-Item -ItemType SymbolicLink -Path ~\.gitconfig    -Target "$(pwd)\gitconfig"
# New-Item -ItemType SymbolicLink -Path ~\.git_template -Target "$(pwd)\git_template"
# New-Item -ItemType SymbolicLink -Path ~\vimfiles      -Target "$(pwd)\vim"
# New-Item -ItemType SymbolicLink -Path ~\_vimrc        -Target "$(pwd)\vimrc"

gvim +PlugInstall +qall
```
