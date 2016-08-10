" vim:set foldmethod=marker:
"=============================================================================
" File: vimlc.vim
" Author: Keisuke Kawhara
" Created: 2016-08-10
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_vimlc')
    finish
endif
let g:loaded_vimlc = 1

let s:save_cpo = &cpo
set cpo&vim

if !exists("g:vimlc_project_root_symbols") " {{{
  let g:vimlc_project_root_symbols = [
        \ '.git',
        \ '.hg',
        \ '.svn',
        \ '.csv',
        \ ]
endif


augroup Vimlc
  autocmd!
  autocmd BufWinEnter,BufNewFile .vimlc setlocal filetype=vim
  autocmd VimEnter * call s:apply_dot_vimlc(expand('%:p:h'))

  function! s:apply_dot_vimlc(search_dir)
    if len(a:search_dir) <= 0
      return
    endif

    let target = a:search_dir . '/.vimlc'
    if 0 < len(glob(target))
      exe "source " . target
    else
      if a:search_dir ==# '/'
        return
      endif
      for terminate in g:vimlc_project_root_symbols
        let term_path = a:search_dir . '/' . terminate
        if 0 < len(glob(term_path))
          return
        endif
      endfor
      let next_path = '/' . join(split(a:search_dir, '/')[:-2], '/')
      call s:apply_dot_vimlc(next_path)
    endif
  endfunction
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
