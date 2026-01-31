for url in $(curl -s http://web0x04.hbtn/sitemap.xml | grep -oP 'http://[^<]+'); do
  size=$(curl -s $url | wc -c)
  echo "$size  $url"
done | sort -n
