# Defined in - @ line 0
function config --description 'alias config=/usr/bin/git --git-dir=/home/dirvine/.cfg/ --work-tree=/home/dirvine'
	/usr/bin/git --git-dir=/home/dirvine/.cfg/ --work-tree=/home/dirvine $argv;
end
