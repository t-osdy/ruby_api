require 'json'
require 'open-uri'

print "検索ワードを入力してください： "
keyword = STDIN.gets
print "\n[[[  検索中...  ]]]\n\n"

url = "http://connpass.com/api/v1/event/?keyword=#{keyword}"
html = open(url).read
json = JSON.parser.new(html)

#parse()メソッドでハッシュ生成
hash = json.parse()
parsed = hash['events']

print "最新の10件を表示します\n\n"

parsed.each do |event|
	puts Time.parse(event['started_at']).strftime("%Y-%m-%d")
	puts event['title']
	puts ""
end
