pkgname=clipboard-over-ssh-git
pkgver=r3.45b6002
pkgrel=1
pkgdesc="copy clipboard command from the remote clipboard (ment to be used with micro editor)"
arch=(any)
url="https://github.com/denisde4ev/clipboard-over-ssh"
license=(WTFPL)
depends=(
	sh
	ssh-client-path # get it from current repo ./ssh-client-path and install it asdeps
)
provides=(
	ssh-clipboard-get
	ssh-clipboard-set
	ssh-connect-with-clipboard
	ssh-get-from-connected-with-clipboard-fzf

	termux-clipboard-set
	termux-clipboard-get
)
conflicts=(
	"${pkgname%-git}"
	termux-api # termux-api provides  termux-clipboard-set and termux-clipboard-get commands
)
source=(
	ssh-connect-with-clipboard
	ssh-get-from-connected-with-clipboard-fzf
	ssh-clipboard-set
	ssh-clipboard-get
)
md5sums=(
	SKIP
	SKIP
	SKIP
	SKIP
)


pkgver() {
	cd "$startdir"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir"
	install -Dm755 ssh-connect-with-clipboard                "$pkgdir"/usr/bin/ssh-connect-with-clipboard               
	install -Dm755 ssh-get-from-connected-with-clipboard-fzf "$pkgdir"/usr/bin/ssh-get-from-connected-with-clipboard-fzf

	install -Dm755 ssh-clipboard-set                         "$pkgdir"/usr/bin/ssh-client/termux-clipboard-set
	install -Dm755 ssh-clipboard-set                         "$pkgdir"/usr/bin/ssh-client/ssh-clipboard-set
	install -Dm755 ssh-clipboard-get                         "$pkgdir"/usr/bin/ssh-client/termux-clipboard-get
	install -Dm755 ssh-clipboard-get                         "$pkgdir"/usr/bin/ssh-client/ssh-clipboard-get
}
