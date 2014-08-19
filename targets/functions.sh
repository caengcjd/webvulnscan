# Download function
# $1 - url
# $2 - destination

download() {
	target="$TMPDIR/$2"
	if [ -e "$target" ]; then
		return
	fi
	if wget -O "$target.part" -- "$1" ; then
		mv -T -- "$target.part" "$target"
	fi
}

printError() {
	echo ""
	printf '\E[31m'; echo "[ERROR] $@"; printf '\E[0m'
	echo ""
}

printInfo() {
	printf '\E[34m'; echo "[INFO] $@"; printf '\E[0m'
}

installPackage() {
	sudo DEBIAN_FRONTEND=noninteractive apt-get -qqy install "$@"
}

timestamp() {
  date +"%s"
}

isInstalled(){
    if [[ -d "$INSTALL_DIR/$1" ]] && [[ -n "$INSTALL_DIR/$1" ]] ; then
        return 0
    else
        return 1
    fi
}

buildIndex() {
OUTPUT='<html>
	<head><title>WVS Targets</title>
	<style type="text/css">
		li { margin-bottom: 3px; font-size: 1.5em;}
		td { padding: 2px 5px;}
		caption { font-weight: bold; font-size: 1.125em; text-align: left; margin: 10px 0 5px 0}
		.tabTitle td { font-weight: bold; }
	</style>
	</head>
	<body>
		<br />
		<table cellspacing=2 cellpadding=2 border=1 stlye="margin: 50px 0 0 20px;">
			<caption>Available applications</caption>
			<tr class="tabTitle">
				<td>#</td>
				<td>Application</td>
				<td>Status</td>
				<td style="width: 300px;">Comment</td>
			</tr>
			<tr><td>01</td>'
	if isInstalled "adhocracy"; then
		OUTPUT=$OUTPUT.'<td><a href="./adhocracy" title="Open Adhocracy">Adhocracy</a></td><td>installed</td><td>&nbsp;</td>'
	else
		OUTPUT=$OUTPUT.'<td>Adhocracy</td><td>not installed</td><td>&nbsp;</td>'
	fi
	OUTPUT=$OUTPUT.'</tr>'

	OUTPUT=$OUTPUT.'<tr><td>02</td>'
	if isInstalled "alfresco-4.2.1"; then
		OUTPUT=$OUTPUT.'<td><a href="http://localhost:8080/share" title="Open Alfresco">Alfresco</a></td><td>installed</td><td>&nbsp;</td>'
	else
		OUTPUT=$OUTPUT.'<td>Alfresco</td><td>not installed</td><td>&nbsp;</td>'
	fi
	OUTPUT=$OUTPUT.'</tr>'

	OUTPUT=$OUTPUT.'<tr><td>03</td>'
	if isInstalled "diaspora"; then
		OUTPUT=$OUTPUT.'<td><a href="http://diaspora.wvs.localhost" title="Open Diaspora">Diaspora</a></td><td>installed</td><td>&nbsp;</td>'
	else
		OUTPUT=$OUTPUT.'<td>Diaspora</td><td>not installed</td><td>&nbsp;</td>'
	fi
	OUTPUT=$OUTPUT.'</tr>'

	OUTPUT=$OUTPUT.'<tr><td>04</td>'
	if isInstalled "dokuwiki"; then
		OUTPUT=$OUTPUT.'<td><a href="./dokuwiki" title="Open DokuWiki">DokuWiki</a></td><td>installed</td><td>&nbsp;</td>'
	else
		OUTPUT=$OUTPUT.'<td>DokuWiki</td><td>not installed</td><td>&nbsp;</td>'
	fi
	OUTPUT=$OUTPUT.'</tr>'

	OUTPUT=$OUTPUT.'<tr><td>05</td>'
	if isInstalled "drupal"; then
		OUTPUT=$OUTPUT.'<td><a href="./drupal" title="Open Drupal">Drupal</a></td><td>installed</td><td>&nbsp;</td>'
	else
		OUTPUT=$OUTPUT.'<td>Drupal</td><td>not installed</td><td>&nbsp;</td>'
	fi
	OUTPUT=$OUTPUT.'</tr>'

	OUTPUT=$OUTPUT.'<tr><td>06</td>'
	if isInstalled "ejbca"; then
		OUTPUT=$OUTPUT.'<td><a href="#" title="Open EJBCA">EJBCA</a></td><td>installed</td><td>&nbsp;</td>'
	else
		OUTPUT=$OUTPUT.'<td>EJBCA</td><td>not installed</td><td>&nbsp;</td>'
	fi
	OUTPUT=$OUTPUT.'</tr>'

	OUTPUT=$OUTPUT.'<tr><td>07</td>'
	if isInstalled "idempiere"; then
		OUTPUT=$OUTPUT.'<td><a href="#" title="Open iDempiere">iDempiere</a></td><td>installed</td><td>&nbsp;</td>'
	else
		OUTPUT=$OUTPUT.'<td>iDempiere</td><td>not installed</td><td>&nbsp;</td>'
	fi
	OUTPUT=$OUTPUT.'</tr>'

	OUTPUT=$OUTPUT.'<tr><td>08</td>'
	if isInstalled "magento"; then
		OUTPUT=$OUTPUT.'<td><a href="./magento" title="Open Magento">Magento</a></td><td>installed</td><td>&nbsp;</td>'
	else
		OUTPUT=$OUTPUT.'<td>Magento</td><td>not installed</td><td>&nbsp;</td>'
	fi
	OUTPUT=$OUTPUT.'</tr>'

	OUTPUT=$OUTPUT.'<tr><td>09</td>'
	if isInstalled "mediawiki"; then
		OUTPUT=$OUTPUT.'<td><a href="./mediawiki" title="Open MediaWiki">MediaWiki</a></td><td>installed</td><td>&nbsp;</td>'
	else
		OUTPUT=$OUTPUT.'<td>MediaWiki</td><td>not installed</td><td>&nbsp;</td>'
	fi
	OUTPUT=$OUTPUT.'</tr>'

	OUTPUT=$OUTPUT.'<tr><td>10</td>'
	if isInstalled "moodle"; then
		OUTPUT=$OUTPUT.'<td><a href="./moodle" title="Open Moodle">Moodle</a></td><td>installed</td><td>&nbsp;</td>'
	else
		OUTPUT=$OUTPUT.'<td>Moodle</td><td>not installed</td><td>&nbsp;</td>'
	fi
	OUTPUT=$OUTPUT.'</tr>'

	OUTPUT=$OUTPUT.'<tr><td>11</td>'
	if isInstalled "otrs"; then
		OUTPUT=$OUTPUT.'<td><a href="./otrs/index.pl" title="Open OTRS">OTRS</a></td><td>installed</td><td>&nbsp;</td>'
	else
		OUTPUT=$OUTPUT.'<td>OTRS</td><td>not installed</td><td>&nbsp;</td>'
	fi
	OUTPUT=$OUTPUT.'</tr>'

	OUTPUT=$OUTPUT.'<tr><td>12</td>'
	if isInstalled "owncloud"; then
		OUTPUT=$OUTPUT.'<td><a href="./owncloud" title="Open Owncloud">Owncloud</a></td><td>installed</td><td>&nbsp;</td>'
	else
		OUTPUT=$OUTPUT.'<td>Owncloud</td><td>not installed</td><td>&nbsp;</td>'
	fi
	OUTPUT=$OUTPUT.'</tr>'

	OUTPUT=$OUTPUT.'<tr><td>13</td>'
	if isInstalled "sugarcrm"; then
		OUTPUT=$OUTPUT.'<td><a href="./sugarcrm" title="Open SugarCRM">SugarCRM</a></td><td>installed</td><td>&nbsp;</td>'
	else
		OUTPUT=$OUTPUT.'<td>SugarCRM</td><td>not installed</td><td>&nbsp;</td>'
	fi
	OUTPUT=$OUTPUT.'</tr>'

	OUTPUT=$OUTPUT.'<tr><td>14</td>'
	if isInstalled "typo3"; then
		OUTPUT=$OUTPUT.'<td><a href="./typo3" title="Open Typo3">Typo3</a></td><td>installed</td><td>&nbsp;</td>'
	else
		OUTPUT=$OUTPUT.'<td>Typo3</td><td>not installed</td><td>&nbsp;</td>'
	fi
	OUTPUT=$OUTPUT.'</tr>'

	OUTPUT=$OUTPUT.'<tr><td>15</td>'
	if isInstalled "wordpress"; then
		OUTPUT=$OUTPUT.'<td><a href="./wordpress" title="Open Wordpress">Wordpress</a></td><td>installed</td><td>&nbsp;</td>'
	else
		OUTPUT=$OUTPUT.'<td>Wordpress</td><td>not installed</td><td>&nbsp;</td>'
	fi
	OUTPUT=$OUTPUT.'</tr>'

	OUTPUT=$OUTPUT.'</table>
		<p style="font-weight: bold">Please note: If not other specified, the login for every application is webwvs // webwvs12</p>
		</html>	'

	echo "$OUTPUT" > $INSTALL_DIR/index.php
}

printInfoIndex(){
	echo ""
	echo ""
	echo "################################################################"
	echo "Please visit http://wvs.localhost to view installed applications"
	echo "################################################################"
	echo ""
	echo ""
}