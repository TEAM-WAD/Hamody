URL     = require("./libs/url")
JSON    = require("./libs/dkjson")
serpent = require("libs/serpent")
json = require('libs/json')
Redis = require('libs/redis').connect('127.0.0.1', 6379)
http  = require("socket.http")
https   = require("ssl.https")
SshId = io.popen("echo $SSH_CLIENT ︙ awk '{ print $1}'"):read('*a')
Fx = require './libs/td'
local Fasttt =  require('tdlua') 
local client = Fasttt()
local tdf = Fx.xnxx()
local FileInformation = io.open("./Information.lua","r")
if not FileInformation then
if not Redis:get(SshId.."Info:Redis:Token") then
io.write('\27[1;31mارسل لي توكن البوت الان \nSend Me a Bot Token Now ↡\n\27[0;39;49m')
local TokenBot = io.read()
if TokenBot and TokenBot:match('(%d+):(.*)') then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe')
local Json_Info = JSON.decode(url)
if res ~= 200 then
print('\27[1;34mعذرا توكن البوت خطأ تحقق منه وارسله مره اخره \nBot Token is Wrong\n')
else
io.write('\27[1;34mتم حفظ التوكن بنجاح \nThe token been saved successfully \n\27[0;39;49m')
TheTokenBot = TokenBot:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..TheTokenBot)
Redis:set(SshId.."Info:Redis:Token",TokenBot)
Redis:set(SshId.."Info:Redis:Token:User",Json_Info.result.username)
end 
else
print('\27[1;34mلم يتم حفظ التوكن جرب مره اخره \nToken not saved, try again')
end 
os.execute('lua5.2 Fast.lua')
end
if not Redis:get(SshId.."Info:Redis:User") then
io.write('\27[1;31mارسل معرف المطور الاساسي الان \nDeveloper UserName saved ↡\n\27[0;39;49m')
local UserSudo = io.read():gsub('@','')
if UserSudo ~= '' then
io.write('\n\27[1;34mتم حفظ معرف المطور \nDeveloper UserName saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User",UserSudo)
else
print('\n\27[1;34mلم يتم حفظ معرف المطور الاساسي \nDeveloper UserName not saved\n')
end 
os.execute('lua5.2 Fast.lua')
end
if not Redis:get(SshId.."Info:Redis:User:ID") then
io.write('\27[1;31mارسل ايدي المطور الاساسي الان \nDeveloper ID saved ↡\n\27[0;39;49m')
local UserId = io.read()
if UserId and UserId:match('(%d+)') then
io.write('\n\27[1;34mتم حفظ ايدي المطور \nDeveloper ID saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User:ID",UserId)
else
print('\n\27[1;34mلم يتم حفظ ايدي المطور الاساسي \nDeveloper ID not saved\n')
end 
os.execute('lua5.2 Fast.lua')
end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Redis:get(SshId.."Info:Redis:Token")..[[",
UserBot = "]]..Redis:get(SshId.."Info:Redis:Token:User")..[[",
UserSudo = "]]..Redis:get(SshId.."Info:Redis:User")..[[",
SudoId = ]]..Redis:get(SshId.."Info:Redis:User:ID")..[[
}
]])
Informationlua:close()
local Fast = io.open("Fast", 'w')
Fast:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
lua5.3 Fast.lua
done
]])
Fast:close()
Redis:del(SshId.."Info:Redis:User:ID");Redis:del(SshId.."Info:Redis:User");Redis:del(SshId.."Info:Redis:Token:User");Redis:del(SshId.."Info:Redis:Token")
os.execute('rm -rf bot.zip ;chmod +x *;./Run')
end
Information = dofile('./Information.lua')
Sudo_Id = Information.SudoId
UserSudo = Information.UserSudo
Token = Information.Token
UserBot = Information.UserBot
Fast = Token:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..Fast)
bot = Fx.Fastbots.set_config{api_id=2692371,api_hash='fe85fff033dfe0f328aeb02b4f784930',session_name=Fast,token=Token}
chsource = Redis:get(Fast..'chsource') or "Ioutb"
devsource = Redis:get(Fast..'devsource') or "QQQQ7O"
function var(value)  
print(serpent.block(value, {comment=false}))   
end 
function requestt(req)
local link = io.popen('curl -s "'..req..'"'):read('*a')
return link
end
clock = os.clock
function sleep(n)
local t0 = clock()
while clock() - t0 <= n do end
end
function convert_time(hours)
  local second = 0
  if hours ~= nil then
      second = hours * 3600
  end
  return second
end
function request(req)
local link = io.popen('curl -s "'..req..'"'):read('*a')
return link
end
function ctime(seconds)
local seconds = tonumber(seconds)
if seconds <= 0 then
return "00:00"
else
hours = string.format("%02.f", math.floor(seconds/3600));
mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));
secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));
return mins..":"..secs
end
end
function plugins(msg)
for v in io.popen('ls plugin'):lines() do
if v:match(".lua$") and not Redis:sismember(Fast..'files',v) then
plugin = dofile("plugin/"..v)
if plugin and plugin.Fast and msg then
results = plugin.Fast(msg)
end
end
end
end
function RunCallBack(msg)
plugin = dofile("src/Callback.lua")
if plugin and plugin.Fast and msg then
results = plugin.Fast(msg)
end
end

function src(msg)
for v in io.popen('ls src'):lines() do
if v:match(".lua$") then
src_files = dofile("src/"..v)
if src_files and src_files.Fast and msg then
results = src_files.Fast(msg)
end
end
end
end
function start_src()
i = 0
t = "source files \n"
for v in io.popen('ls src'):lines() do
if v:match(".lua$") then
i = i + 1
t = t.."\27[39m"..i.."\27[36m".." - \27[10;32m"..v..",\27[m \n"
end
end
print(t)
end
start_src()
function start_plugin()
i = 0
t = "plugins \n"
for v in io.popen('ls plugin'):lines() do
if v:match(".lua$") then
i = i + 1
t = t.."\27[39m"..i.."\27[36m".." - \27[10;32m"..v..",\27[m \n"
end
end
print(t)
end
start_plugin()
function s_api(web) 
local info, res = https.request(web) 
local req = json:decode(info) 
if res ~= 200 then 
return false 
end 
if not req.ok then 
return false end 
return req 
end 
function send_inlin_key(chat_id,text,inline,reply_id) 
local keyboard = {} 
keyboard.inline_keyboard = inline 
local send_api = "https://api.telegram.org/bot"..Token.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(keyboard)) 
if reply_id then 
local msg_id = reply_id/2097152/0.5
send_api = send_api.."&reply_to_message_id="..msg_id 
end 
return s_api(send_api) 
end
function edit(chat,rep,text,parse, dis, disn, reply_markup)
shh = tostring(text)
if Redis:get(Fast..'rmzsource') then
shh = shh:gsub("↯︙ ",Redis:get(Fast..'rmzsource'))
end
local listm = Redis:smembers(Fast.."Words:r")
for k,v in pairs(listm) do
i ,j  = string.find(shh, v)
if j and i then
local x = string.sub(shh, i,j)
local neww = Redis:get(Fast.."Word:Replace"..x)  
shh = shh:gsub(x,neww)
else
shh = shh
end
end
return bot.editMessageText(chat,rep,shh, parse, dis, disn, reply_markup)
end
function send(chat,rep,text,parse,dis,clear,disn,back,markup)
sh = tostring(text)
if Redis:get(Fast..'rmzsource') then
sh = sh:gsub("↯︙ ",Redis:get(Fast..'rmzsource'))
end
local listm = Redis:smembers(Fast.."Words:r")
for k,v in pairs(listm) do
i ,j  = string.find(sh, v)
if j and i then
local x = string.sub(sh, i,j)
local neww = Redis:get(Fast.."Word:Replace"..x)  
sh = sh:gsub(x,neww)
else
sh = sh
end
end
return bot.sendText(chat,rep,sh,parse,dis, clear, disn, back, markup)
end
function ss(msg,text) 
return send(msg.chat_id,msg.id,text)
end
function calc(math) 
math = math:gsub(" ","")
if math:match("%d+") then
local res = io.popen("echo 'scale=1; "..math.."' | bc"):read('*a')
return res
else
return "↯︙ لم استطيع اجراء العمليه الحسابيه"
end
end
function getbio(User)
kk = "لا يوجد"
local url = https.request("https://api.telegram.org/bot"..Token.."/getchat?chat_id="..User);
data = json:decode(url)
if data.result then
if data.result.bio then
kk = data.result.bio
end
end
return kk
end
function chat_type(ChatId)
if ChatId then
local id = tostring(ChatId)
if id:match("-100(%d+)") then
Chat_Type = 'GroupBot' 
elseif id:match("^(%d+)") then
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot' 
end
end
return Chat_Type
end
function coin(coin)
local Coins = tostring(coin)
local Coins = Coins:gsub('٠','0')
local Coins = Coins:gsub('١','1')
local Coins = Coins:gsub('٢','2')
local Coins = Coins:gsub('٣','3')
local Coins = Coins:gsub('٤','4')
local Coins = Coins:gsub('٥','5')
local Coins = Coins:gsub('٦','6')
local Coins = Coins:gsub('٧','7')
local Coins = Coins:gsub('٨','8')
local Coins = Coins:gsub('٩','9')
local Coins = Coins:gsub('-','')
local conis = tonumber(Coins)
return conis
end
function The_ControllerAll(UserId)
ControllerAll = false
local ListSudos = {Sudo_Id,2100004938,1705756127,627658332,5986905034,6430417482,55555555555,5555555555}
for k, v in pairs(ListSudos) do
if tonumber(UserId) == tonumber(v) then
ControllerAll = true
end
if Redis:sismember(Fast.."ControlAll:Groups",UserId) then
ControllerAll = true
end
end
return ControllerAll
end
function mderall(msg)
mderall = false
local statuse = Redis:sismember(Fast.."Specialall:Group",senderr)
if statuse then
mderall = true
end
return mderall
end
function Controllerbanall(ChatId,UserId)
Status = 0
local Controll2 = Redis:sismember(Fast.."ControlAll:Groups",UserId)
Devss = Redis:sismember(Fast.."Devss:Groups",UserId) 
if UserId == 2100004938 then
Status = true
elseif UserId == 1705756127 then
Status = true
elseif UserId == 37377383830 then
Status = true
elseif UserId == 84484884847 then
Status = true
elseif UserId == 84488484848 then
Status = true
elseif UserId == 73377373739 then
Status = true
elseif UserId == 74383884840 then
Status = true
elseif UserId == Sudo_Id then  
Status = true
elseif UserId == Fast then
Status = true
elseif Controll2 then
Status = true
elseif Devss then
Status = true
else
Status = false
end
return Status
end
function Controller(ChatId,UserId)
Status = 0
UserId = tonumber(UserId)
local Controll2 = Redis:sismember(Fast.."ControlAll:Groups",UserId)
Dev = Redis:sismember(Fast.."Dev:Groups",UserId) 
Devss = Redis:sismember(Fast.."Devss:Groups",UserId) 
Ownerss = Redis:sismember(Fast.."Ownerss:Group"..ChatId,UserId) 
SuperCreator = Redis:sismember(Fast.."SuperCreator:Group"..ChatId,UserId) 
Creator = Redis:sismember(Fast.."Creator:Group"..ChatId,UserId)
Manger = Redis:sismember(Fast.."Manger:Group"..ChatId,UserId)
Admin = Redis:sismember(Fast.."Admin:Group"..ChatId,UserId)
Special = Redis:sismember(Fast.."Special:Group"..ChatId,UserId)
StatusMember = bot.getChatMember(ChatId,UserId).status.Fastbots
if UserId == 2100004938 then
Status = 'تاج راس قتو'
elseif UserId == 1705756127 then
Status = 'مطـور السـورس '
elseif UserId == 73738383830 then
Status = 'مطـور السـورس '
elseif UserId == 73738383830 then
Status = 'مطـور السـورس '
elseif UserId == 73738383830 then
Status = ' ستك لولا يقلب امك ❤️‍🔥 '
elseif UserId == 73738383830 then
Status = 'مطـور السـورس '
elseif UserId == Sudo_Id then  
Status = 'المطـور الاساسي '
elseif Controll2 then
Status = 'المطـور الاساسي '
elseif UserId == Fast then
Status = 'البوت'
elseif Devss then
Status = 'المطـور الثانوي '
elseif Dev then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Developer:Bot:Reply"..ChatId) or 'المطور '
elseif Ownerss then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."PresidentQ:Group:Reply"..ChatId) or  'المــــــالك'
elseif SuperCreator then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."President:Group:Reply"..ChatId) or 'المنشئ الاساسي'
elseif Creator then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Constructor:Group:Reply"..ChatId) or 'المنشئ '
elseif Manger then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Manager:Group:Reply"..ChatId) or 'مدير'
elseif Admin then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Admin:Group:Reply"..ChatId) or 'ادمن'
elseif StatusMember == "chatMemberStatusCreator" then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or 'مالك الكروب'
elseif StatusMember == "chatMemberStatusAdministrator" then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or 'مشرف '
elseif Special then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Vip:Group:Reply"..ChatId) or 'مميز '
else
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Mempar:Group:Reply"..ChatId) or 'العضـو'
end  
return Status
end 
function Controller_Num(Num)
Status = 0
if tonumber(Num) == 1 then  
Status = 'المطور الاساسي'
elseif tonumber(Num) == 2 then  
Status = 'المطور الثانوي'
elseif tonumber(Num) == 3 then  
Status = 'المطور'
elseif tonumber(Num) == 4 then  
Status = 'المنشئ الاساسي'
elseif tonumber(Num) == 5 then  
Status = 'المنشئ'
elseif tonumber(Num) == 6 then  
Status = 'المدير'
elseif tonumber(Num) == 7 then  
Status = 'الادمن'
elseif tonumber(Num) == 8 then  
Status = 'المالك'
else
Status = 'المميز'
end  
return Status
end 
function FlterBio(Bio)
local Bio = tostring(Bio)
Bio = Bio:gsub("https://[%a%d_]+",'') 
Bio = Bio:gsub("http://[%a%d_]+",'') 
Bio = Bio:gsub("telegram.dog/[%a%d_]+",'') 
Bio = Bio:gsub("telegram.me/[%a%d_]+",'') 
Bio = Bio:gsub("t.me/[%a%d_]+",'') 
Bio = Bio:gsub("[%a%d_]+.pe[%a%d_]+",'') 
Bio = Bio:gsub("@[%a%d_]+",'')
Bio = Bio:gsub("]","")
Bio = Bio:gsub("[[]","")
return Bio
end
function last_id(channel)
local api = https.request("https://anubis.fun/api/post_num.php?channel="..channel)
local api_decode = JSON.decode(api)
local num = api_decode["last_post_id"]
return tonumber(num)
end
function GetAdminsSlahe(ChatId,UserId,user2,MsgId,t1,t2,t3,t4,t5,t6)
local GetMemberStatus = bot.getChatMember(ChatId,user2).status 
if GetMemberStatus.can_change_info then
change_info = '⦗ ✓ ⦘' else change_info ='⦗ ✗ ⦘'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '⦗ ✓ ⦘' else delete_messages ='⦗ ✗ ⦘'
end
if GetMemberStatus.can_invite_users then
invite_users = '⦗ ✓ ⦘' else invite_users ='⦗ ✗ ⦘'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '⦗ ✓ ⦘' else pin_messages ='⦗ ✗ ⦘'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '⦗ ✓ ⦘' else restrict_members ='⦗ ✗ ⦘'
end
if GetMemberStatus.can_promote_members then
promote = '⦗ ✓ ⦘' else promote ='⦗ ✗ ⦘'
end
local reply_markupp = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- تغيير معلومات الكروب : '..(t1 or change_info), data = UserId..'/groupNum1//'..user2}, 
},
{
{text = '- تثبيت الرسائل : '..(t2 or pin_messages), data = UserId..'/groupNum2//'..user2}, 
},
{
{text = '- حظر المستخدمين : '..(t3 or restrict_members), data = UserId..'/groupNum3//'..user2}, 
},
{
{text = '- دعوة المستخدمين : '..(t4 or invite_users), data = UserId..'/groupNum4//'..user2}, 
},
{
{text = '- مسح الرسائل : '..(t5 or delete_messages), data = UserId..'/groupNum5//'..user2}, 
},
{
{text = '- اضافة مشرفين : '..(t6 or promote), data = UserId..'/groupNum6//'..user2}, 
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
edit(ChatId,MsgId,"↯︙ صلاحيات الادمن - ", 'md', false, false, reply_markupp)
end
function editrtp(chat,user,msgid,useri)
if Redis:sismember(Fast.."BanGroup:Group"..chat,useri) then
BanGroupz = "✓"
else
BanGroupz = "✗"
end
if Redis:sismember(Fast.."SilentGroup:Group"..chat,useri) then
SilentGroupz = "✓"
else
SilentGroupz = "✗"
end
if Redis:sismember(Fast.."SuperCreator:Group"..chat,useri)  then
SuperCreatorz = "✓"
else
SuperCreatorz = "✗"
end
if Redis:sismember(Fast.."Creator:Group"..chat,useri) then
Creatorz = "✓"
else
Creatorz = "✗"
end
if Redis:sismember(Fast.."Manger:Group"..chat,useri) then
Mangerz = "✓"
else
Mangerz = "✗"
end
if Redis:sismember(Fast.."Admin:Group"..chat,useri) then
Adminz = "✓"
else
Adminz = "✗"
end
if Redis:sismember(Fast.."Special:Group"..chat,useri) then
Specialz = "✓"
else
Specialz = "✗"
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = '- منشئ اساسي : '..SuperCreatorz, data =user..'/statusSuperCreatorz/'..useri},{text = '- منشئ : '..Creatorz, data =user..'/statusCreatorz/'..useri},
},
{
{text = '- مدير : '..Mangerz, data =user..'/statusMangerz/'..useri},{text = '- ادمن : '..Adminz, data =user..'/statusAdminz/'..useri},
},
{
{text = '- مميز : '..Specialz, data =user..'/statusSpecialz/'..useri},
},
{
{text = '- الحظر : '..BanGroupz, data =user..'/statusban/'..useri},{text = '- الكتم : '..SilentGroupz, data =user..'/statusktm/'..useri},
},
{
{text = '- عضو  ', data =user..'/statusmem/'..useri},
},
{
{text = '- اخفاء الامر ', data ='/delAmr1'}
}
}
}
return edit(chat,msgid,'*\n↯︙ تحكم برتب الشخص .*', 'md', true, false, reply_markup)
end
function GetAdminsNum(ChatId,UserId)
local GetMemberStatus = bot.getChatMember(ChatId,UserId).status 
if GetMemberStatus.can_change_info then
change_info = 1 else change_info = 0
end
if GetMemberStatus.can_delete_messages then
delete_messages = 1 else delete_messages = 0
end
if GetMemberStatus.can_invite_users then
invite_users = 1 else invite_users = 0
end
if GetMemberStatus.can_pin_messages then
pin_messages = 1 else pin_messages = 0
end
if GetMemberStatus.can_restrict_members then
restrict_members = 1 else restrict_members = 0
end
if GetMemberStatus.can_promote_members then
promote = 1 else promote = 0
end
return{
promote = promote,
restrict_members = restrict_members,
invite_users = invite_users,
pin_messages = pin_messages,
delete_messages = delete_messages,
change_info = change_info
}
end
function GetSetieng(ChatId)
if Redis:get(Fast.."Lock:phshar"..ChatId) then    
alphsar = "✓"
else 
alphsar = "✗"    
end
if Redis:get(Fast.."Lock:alkfr"..ChatId) then    
alkfr = "✓"
else 
alkfr = "✗"    
end
if Redis:get(Fast.."Lock:tphlesh"..ChatId) then    
tphlesh = "✓"
else 
tphlesh = "✗"    
end
if Redis:get(Fast.."Lock:farsia"..ChatId) then    
farsia = "✓"
else 
farsia = "✗"    
end

if Redis:get(Fast.."lockpin"..ChatId) then    
lock_pin = "✓"
else 
lock_pin = "✗"    
end
if Redis:get(Fast.."Lock:tagservr"..ChatId) then    
lock_tagservr = "✓"
else 
lock_tagservr = "✗"
end
if Redis:get(Fast.."Lock:text"..ChatId) then    
lock_text = "✓"
else 
lock_text = "✗ "    
end
if Redis:get(Fast.."Lock:AddMempar"..ChatId) == "kick" then
lock_add = "✓"
else 
lock_add = "✗ "    
end    
if Redis:get(Fast.."Lock:Join"..ChatId) == "kick" then
lock_join = "✓"
else 
lock_join = "✗ "    
end    
if Redis:get(Fast.."Lock:edit"..ChatId) then    
lock_edit = "✓"
else 
lock_edit = "✗ "    
end
if Redis:get(Fast.."Chek:Welcome"..ChatId) then
welcome = "✓"
else 
welcome = "✗ "    
end
if Redis:hget(Fast.."Spam:Group:User"..ChatId, "Spam:User") == "kick" then     
flood = "بالطرد "     
elseif Redis:hget(Fast.."Spam:Group:User"..ChatId,"Spam:User") == "keed" then     
flood = "بالتقييد "     
elseif Redis:hget(Fast.."Spam:Group:User"..ChatId,"Spam:User") == "mute" then     
flood = "بالكتم "           
elseif Redis:hget(Fast.."Spam:Group:User"..ChatId,"Spam:User") == "del" then     
flood = "✓"
else     
flood = "✗ "     
end
if Redis:get(Fast.."Lock:Photo"..ChatId) == "del" then
lock_photo = "✓" 
elseif Redis:get(Fast.."Lock:Photo"..ChatId) == "ked" then 
lock_photo = "بالتقييد "   
elseif Redis:get(Fast.."Lock:Photo"..ChatId) == "ktm" then 
lock_photo = "بالكتم "    
elseif Redis:get(Fast.."Lock:Photo"..ChatId) == "kick" then 
lock_photo = "بالطرد "   
else
lock_photo = "✗ "   
end    
if Redis:get(Fast.."Lock:Contact"..ChatId) == "del" then
lock_phon = "✓" 
elseif Redis:get(Fast.."Lock:Contact"..ChatId) == "ked" then 
lock_phon = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Contact"..ChatId) == "ktm" then 
lock_phon = "بالكتم "    
elseif Redis:get(Fast.."Lock:Contact"..ChatId) == "kick" then 
lock_phon = "بالطرد "    
else
lock_phon = "✗ "    
end    
if Redis:get(Fast.."Lock:Link"..ChatId) == "del" then
lock_links = "✓"
elseif Redis:get(Fast.."Lock:Link"..ChatId) == "ked" then
lock_links = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Link"..ChatId) == "ktm" then
lock_links = "بالكتم "    
elseif Redis:get(Fast.."Lock:Link"..ChatId) == "kick" then
lock_links = "بالطرد "    
else
lock_links = "✗ "    
end
if Redis:get(Fast.."Lock:Cmd"..ChatId) == "del" then
lock_cmds = "✓"
elseif Redis:get(Fast.."Lock:Cmd"..ChatId) == "ked" then
lock_cmds = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Cmd"..ChatId) == "ktm" then
lock_cmds = "بالكتم "   
elseif Redis:get(Fast.."Lock:Cmd"..ChatId) == "kick" then
lock_cmds = "بالطرد "    
else
lock_cmds = "✗ "    
end
if Redis:get(Fast.."Lock:User:Name"..ChatId) == "del" then
lock_user = "✓"
elseif Redis:get(Fast.."Lock:User:Name"..ChatId) == "ked" then
lock_user = "بالتقييد "    
elseif Redis:get(Fast.."Lock:User:Name"..ChatId) == "ktm" then
lock_user = "بالكتم "    
elseif Redis:get(Fast.."Lock:User:Name"..ChatId) == "kick" then
lock_user = "بالطرد "    
else
lock_user = "✗ "    
end
if Redis:get(Fast.."Lock:hashtak"..ChatId) == "del" then
lock_hash = "✓"
elseif Redis:get(Fast.."Lock:hashtak"..ChatId) == "ked" then 
lock_hash = "بالتقييد "    
elseif Redis:get(Fast.."Lock:hashtak"..ChatId) == "ktm" then 
lock_hash = "بالكتم "    
elseif Redis:get(Fast.."Lock:hashtak"..ChatId) == "kick" then 
lock_hash = "بالطرد "    
else
lock_hash = "✗ "    
end
if Redis:get(Fast.."Lock:vico"..ChatId) == "del" then
lock_muse = "✓"
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "ked" then 
lock_muse = "بالتقييد "    
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "ktm" then 
lock_muse = "بالكتم "    
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "kick" then 
lock_muse = "بالطرد "    
else
lock_muse = "✗ "    
end 
if Redis:get(Fast.."Lock:Video"..ChatId) == "del" then
lock_ved = "✓"
elseif Redis:get(Fast.."Lock:Video"..ChatId) == "ked" then 
lock_ved = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Video"..ChatId) == "ktm" then 
lock_ved = "بالكتم "    
elseif Redis:get(Fast.."Lock:Video"..ChatId) == "kick" then 
lock_ved = "بالطرد "    
else
lock_ved = "✗ "    
end
if Redis:get(Fast.."Lock:Animation"..ChatId) == "del" then
lock_gif = "✓"
elseif Redis:get(Fast.."Lock:Animation"..ChatId) == "ked" then 
lock_gif = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Animation"..ChatId) == "ktm" then 
lock_gif = "بالكتم "    
elseif Redis:get(Fast.."Lock:Animation"..ChatId) == "kick" then 
lock_gif = "بالطرد "    
else
lock_gif = "✗ "    
end
if Redis:get(Fast.."Lock:Sticker"..ChatId) == "del" then
lock_ste = "✓"
elseif Redis:get(Fast.."Lock:Sticker"..ChatId) == "ked" then 
lock_ste = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Sticker"..ChatId) == "ktm" then 
lock_ste = "بالكتم "    
elseif Redis:get(Fast.."Lock:Sticker"..ChatId) == "kick" then 
lock_ste = "بالطرد "    
else
lock_ste = "✗ "    
end
if Redis:get(Fast.."Lock:geam"..ChatId) == "del" then
lock_geam = "✓"
elseif Redis:get(Fast.."Lock:geam"..ChatId) == "ked" then 
lock_geam = "بالتقييد "    
elseif Redis:get(Fast.."Lock:geam"..ChatId) == "ktm" then 
lock_geam = "بالكتم "    
elseif Redis:get(Fast.."Lock:geam"..ChatId) == "kick" then 
lock_geam = "بالطرد "    
else
lock_geam = "✗ "    
end    
if Redis:get(Fast.."Lock:vico"..ChatId) == "del" then
lock_vico = "✓"
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "ked" then 
lock_vico = "بالتقييد "    
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "ktm" then 
lock_vico = "بالكتم "    
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "kick" then 
lock_vico = "بالطرد "    
else
lock_vico = "✗ "    
end    
if Redis:get(Fast.."Lock:Keyboard"..ChatId) == "del" then
lock_inlin = "✓"
elseif Redis:get(Fast.."Lock:Keyboard"..ChatId) == "ked" then 
lock_inlin = "بالتقييد "
elseif Redis:get(Fast.."Lock:Keyboard"..ChatId) == "ktm" then 
lock_inlin = "بالكتم "    
elseif Redis:get(Fast.."Lock:Keyboard"..ChatId) == "kick" then 
lock_inlin = "بالطرد "
else
lock_inlin = "✗ "
end
if Redis:get(Fast.."Lock:forward"..ChatId) == "del" then
lock_fwd = "✓"
elseif Redis:get(Fast.."Lock:forward"..ChatId) == "ked" then 
lock_fwd = "بالتقييد "    
elseif Redis:get(Fast.."Lock:forward"..ChatId) == "ktm" then 
lock_fwd = "بالكتم "    
elseif Redis:get(Fast.."Lock:forward"..ChatId) == "kick" then 
lock_fwd = "بالطرد "    
else
lock_fwd = "✗ "    
end    
if Redis:get(Fast.."Lock:Document"..ChatId) == "del" then
lock_file = "✓"
elseif Redis:get(Fast.."Lock:Document"..ChatId) == "ked" then 
lock_file = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Document"..ChatId) == "ktm" then 
lock_file = "بالكتم "    
elseif Redis:get(Fast.."Lock:Document"..ChatId) == "kick" then 
lock_file = "بالطرد "    
else
lock_file = "✗ "    
end    
if Redis:get(Fast.."Lock:Unsupported"..ChatId) == "del" then
lock_self = "✓"
elseif Redis:get(Fast.."Lock:Unsupported"..ChatId) == "ked" then 
lock_self = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Unsupported"..ChatId) == "ktm" then 
lock_self = "بالكتم "    
elseif Redis:get(Fast.."Lock:Unsupported"..ChatId) == "kick" then 
lock_self = "بالطرد "    
else
lock_self = "✗ "    
end
if Redis:get(Fast.."Lock:Bot:kick"..ChatId) == "del" then
lock_bots = "✓"
elseif Redis:get(Fast.."Lock:Bot:kick"..ChatId) == "ked" then
lock_bots = "بالتقييد "   
elseif Redis:get(Fast.."Lock:Bot:kick"..ChatId) == "kick" then
lock_bots = "بالطرد "    
else
lock_bots = "✗ "    
end
if Redis:get(Fast.."Lock:Markdaun"..ChatId) == "del" then
lock_mark = "✓"
elseif Redis:get(Fast.."Lock:Markdaun"..ChatId) == "ked" then 
lock_mark = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Markdaun"..ChatId) == "ktm" then 
lock_mark = "بالكتم "    
elseif Redis:get(Fast.."Lock:Markdaun"..ChatId) == "kick" then 
lock_mark = "بالطرد "    
else
lock_mark = "✗ "    
end
if Redis:get(Fast.."Lock:Spam"..ChatId) == "del" then    
lock_spam = "✓"
elseif Redis:get(Fast.."Lock:Spam"..ChatId) == "ked" then 
lock_spam = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Spam"..ChatId) == "ktm" then 
lock_spam = "بالكتم "    
elseif Redis:get(Fast.."Lock:Spam"..ChatId) == "kick" then 
lock_spam = "بالطرد "    
else
lock_spam = "✗ "    
end        
return{
lock_pin = lock_pin,
lock_tagservr = lock_tagservr,
lock_text = lock_text,
lock_add = lock_add,
lock_join = lock_join,
lock_edit = lock_edit,
flood = flood,
lock_photo = lock_photo,
lock_phon = lock_phon,
lock_links = lock_links,
lock_cmds = lock_cmds,
lock_mark = lock_mark,
lock_user = lock_user,
lock_hash = lock_hash,
lock_muse = lock_muse,
lock_ved = lock_ved,
lock_gif = lock_gif,
lock_ste = lock_ste,
lock_geam = lock_geam,
lock_vico = lock_vico,
lock_inlin = lock_inlin,
lock_fwd = lock_fwd,
lock_file = lock_file,
lock_self = lock_self,
lock_bots = lock_bots,
lock_spam = lock_spam,
farsia = farsia,
tphlesh = tphlesh,
alkfr = alkfr,
alphsar = alphsar
}
end
function Total_message(Message)  
local MsgText = ''  
if tonumber(Message) < 100 then 
MsgText = 'انت مش بتتفاعل لي ؟'
elseif tonumber(Message) < 200 then 
MsgText = 'متشد شويه في التفاعل'
elseif tonumber(Message) < 400 then 
MsgText = 'انتي مكسوفه تتكلمي يبطه 🙈'
elseif tonumber(Message) < 700 then 
MsgText = 'في احسن من كدا هه'
elseif tonumber(Message) < 1200 then 
MsgText = 'انا عاوزك تولعها 😂🔥'
elseif tonumber(Message) < 2000 then 
MsgText = 'انت متفاعل يبن عمي'
elseif tonumber(Message) < 3500 then 
MsgText = 'بحبك اتفاعل كمان بقا 🥺♥'
elseif tonumber(Message) < 4000 then 
MsgText = 'استمر يبن عمي 😂🔥'
elseif tonumber(Message) < 4500 then 
MsgText = 'عاش كيك ليك'
elseif tonumber(Message) < 5500 then 
MsgText = 'انت مولعها وخاربها هنا 😂♥🔥'
elseif tonumber(Message) < 7000 then 
MsgText = 'تفاعل مفاعل نووي 😂↯︙'
elseif tonumber(Message) < 9500 then 
MsgText = 'تفاعل ام عبير وهي بتكلم ام احمد عشان تجوز احمد لعبير'
elseif tonumber(Message) < 59698717221 then 
MsgText = 'كتفم التفاعل لاجلك 😂↯︙'
end 
return MsgText 
end
function Total_groups(Message)  
local MsgText = ''  
if tonumber(Message) < 200 then 
MsgText = 'سايق مخده 😹' 
elseif tonumber(Message) < 400 then 
MsgText = 'الله بالخير 👋'
elseif tonumber(Message) < 600 then 
MsgText = 'عفيه اتفاعل 😽' 
elseif tonumber(Message) < 800 then 
MsgText = 'بدأ يتحسن 😐' 
elseif tonumber(Message) < 1000 then 
MsgText = 'شكد تحجي 😒' 
elseif tonumber(Message) < 1300 then 
MsgText = 'استمر بطل 😍' 
elseif tonumber(Message) < 1600 then 
MsgText = 'تفاعل غنبله 🙂'  
elseif tonumber(Message) < 1800 then 
MsgText = 'استمر يعسل 🥳' 
elseif tonumber(Message) < 2200 then 
MsgText = 'جيد جدا ♥️' 
elseif tonumber(Message) < 2600 then 
MsgText = 'ممتاز جدا 🥰' 
elseif tonumber(Message) < 3000 then 
MsgText = 'مــلــک 💯😻' 
elseif tonumber(Message) < 3600 then 
MsgText = 'اسطورة التفاعل❤️' 
elseif tonumber(Message) < 59698717221 then 
MsgText = 'ملك التلكرام 💖'  
end 
return MsgText 
end

function Getpermissions(ChatId)
local Get_Chat = bot.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then
web = true else web = false
end
if Get_Chat.permissions.can_change_info then
info = true else info = false
end
if Get_Chat.permissions.can_invite_users then
invite = true else invite = false
end
if Get_Chat.permissions.can_pin_messages then
pin = true else pin = false
end
if Get_Chat.permissions.can_send_media_messages then
media = true else media = false
end
if Get_Chat.permissions.can_send_messages then
messges = true else messges = false
end
if Get_Chat.permissions.can_send_other_messages then
other = true else other = false
end
if Get_Chat.permissions.can_send_polls then
polls = true else polls = false
end

return{
web = web,
info = info,
invite = invite,
pin = pin,
media = media,
messges = messges,
other = other,
polls = polls
}
end
function Get_permissions(ChatId,UserId,MsgId)
local Get_Chat = bot.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then
web = '⦗ ✓ ⦘' else web ='⦗ ✗ ⦘'
end
if Get_Chat.permissions.can_change_info then
info = '⦗ ✓ ⦘' else info ='⦗ ✗ ⦘'
end
if Get_Chat.permissions.can_invite_users then
invite = '⦗ ✓ ⦘' else invite ='⦗ ✗ ⦘'
end
if Get_Chat.permissions.can_pin_messages then
pin = '⦗ ✓ ⦘' else pin ='⦗ ✗ ⦘'
end
if Get_Chat.permissions.can_send_media_messages then
media = '⦗ ✓ ⦘' else media ='⦗ ✗ ⦘'
end
if Get_Chat.permissions.can_send_messages then
messges = '⦗ ✓ ⦘' else messges ='⦗ ✗ ⦘'
end
if Get_Chat.permissions.can_send_other_messages then
other = '⦗ ✓ ⦘' else other ='⦗ ✗ ⦘'
end
if Get_Chat.permissions.can_send_polls then
polls = '⦗ ✓ ⦘' else polls ='⦗ ✗ ⦘'
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- ارسال الويب : '..web, data = UserId..'/web'}, 
},
{
{text = '- تغيير معلومات الكروب : '..info, data = UserId.. '/info'}, 
},
{
{text = '- اضافه مستخدمين : '..invite, data = UserId.. '/invite'}, 
},
{
{text = '- تثبيت الرسائل : '..pin, data = UserId.. '/pin'}, 
},
{
{text = '- ارسال الميديا : '..media, data = UserId.. '/media'}, 
},
{
{text = '- ارسال الرسائل : .'..messges, data = UserId.. '/messges'}, 
},
{
{text = '- اضافه البوتات : '..other, data = UserId.. '/other'}, 
},
{
{text = '- ارسال استفتاء : '..polls, data = UserId.. '/polls'}, 
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
edit(ChatId,MsgId,"↯︙ صلاحيات الكروب - ", 'md', false, false, reply_markup)
end
function Statusrestricted(ChatId,UserId)
return{
KtmAll = Redis:sismember(Fast.."KtmAll:Groups",UserId) ,
BanAll = Redis:sismember(Fast.."BanAll:Groups",UserId) ,
BanGroup = Redis:sismember(Fast.."BanGroup:Group"..ChatId,UserId) ,
SilentGroup = Redis:sismember(Fast.."SilentGroup:Group"..ChatId,UserId)
}
end
function Reply_Status(UserId,TextMsg)
local UserInfo = bot.getUser(UserId)
Name_User = FlterBio(UserInfo.first_name)
UserInfousername = '['..Name_User..'](tg://user?id='..UserId..')'
return {
Lock     = '\n*↯︙ بواسطه ↫ *'..UserInfousername..'\n*'..TextMsg..'\n↯︙ خاصيه المسح *',
unLock   = '\n*↯︙ بواسطه ↫ *'..UserInfousername..'\n'..TextMsg,
lockKtm  = '\n*↯︙ بواسطه ↫ *'..UserInfousername..'\n*'..TextMsg..'\n↯︙ خاصيه الكتم *',
lockKid  = '\n*↯︙ بواسطه ↫ *'..UserInfousername..'\n*'..TextMsg..'\n↯︙ خاصيه التقييد *',
lockKick = '\n*↯︙ بواسطه ↫ *'..UserInfousername..'\n*'..TextMsg..'\n↯︙ خاصيه الطرد *',
Reply    = '\n*↯︙ المستخدم ↫ *'..UserInfousername..'\n*'..TextMsg..'*'
}
end
function StatusCanOrNotCan(ChatId,UserId)
Status = nil
UserId = tonumber(UserId)
local Controll2 = Redis:sismember(Fast.."ControlAll:Groups",UserId)
Devss = Redis:sismember(Fast.."Devss:Groups",UserId) 
Dev = Redis:sismember(Fast.."Dev:Groups",UserId) 
Ownerss = Redis:sismember(Fast.."Ownerss:Group"..ChatId,UserId) 
SuperCreator = Redis:sismember(Fast.."SuperCreator:Group"..ChatId,UserId) 
Creator = Redis:sismember(Fast.."Creator:Group"..ChatId,UserId)
Manger = Redis:sismember(Fast.."Manger:Group"..ChatId,UserId)
Admin = Redis:sismember(Fast.."Admin:Group"..ChatId,UserId)
Special = Redis:sismember(Fast.."Special:Group"..ChatId,UserId)
StatusMember = bot.getChatMember(ChatId,UserId).status.Fastbots
if UserId == 2100004938 then
Status = true
elseif UserId == 1705756127 then
Status = true
elseif UserId == 5555555555 then
Status = true
elseif UserId == 6430417482 then
Status = true
elseif UserId == 5969871722 then
Status = true
elseif UserId == 5986905034 then
Status = true
elseif UserId == 627658332 then
Status = true
elseif UserId == Sudo_Id then  
Status = true
elseif Controll2 then
Status = true
elseif UserId == Fast then
Status = true
elseif Devss then
Status = true
elseif Dev then
Status = true
elseif Ownerss then
Status = true
elseif SuperCreator then
Status = true
elseif Creator then
Status = true
elseif Manger then
Status = true
elseif Admin then
Status = true
elseif Special then
Status = true
else
Status = false
end  
return Status
end 
function StatusSilent(ChatId,UserId)
Status = nil
UserId = tonumber(UserId)
local Controll2 = Redis:sismember(Fast.."ControlAll:Groups",UserId)
Devss = Redis:sismember(Fast.."Devss:Groups",UserId) 
Dev = Redis:sismember(Fast.."Dev:Groups",UserId) 
Ownerss = Redis:sismember(Fast.."Ownerss:Group"..ChatId,UserId) 
SuperCreator = Redis:sismember(Fast.."SuperCreator:Group"..ChatId,UserId) 
Creator = Redis:sismember(Fast.."Creator:Group"..ChatId,UserId)
Manger = Redis:sismember(Fast.."Manger:Group"..ChatId,UserId)
Admin = Redis:sismember(Fast.."Admin:Group"..ChatId,UserId)
Special = Redis:sismember(Fast.."Special:Group"..ChatId,UserId)
StatusMember = bot.getChatMember(ChatId,UserId).status.Fastbots
if UserId == 2100004938 then
Status = true
elseif UserId == 1705756127 then
Status = true
elseif UserId == 5555555555 then
Status = true
elseif UserId == 6430417482 then
Status = true
elseif UserId == 5969871722 then
Status = true
elseif UserId == 5986905034 then
Status = true
elseif UserId == 627658332 then
Status = true
elseif UserId == Sudo_Id then    
Status = true
elseif Controll2 then
Status = true
elseif UserId == Fast then
Status = true
elseif Devss then
Status = true
elseif Dev then
Status = true
elseif Ownerss then
Status = true
elseif SuperCreator then
Status = true
elseif Creator then
Status = true
elseif Manger then
Status = true
elseif Admin then
Status = true
elseif StatusMember == "chatMemberStatusCreator" then
Status = true
else
Status = false
end  
return Status
end 
function GetInfoBot(msg)
local GetMemberStatus = bot.getChatMember(msg.chat_id,Fast).status 
if GetMemberStatus.can_change_info then
change_info = true else change_info = false
end
if GetMemberStatus.can_delete_messages then
delete_messages = true else delete_messages = false
end
if GetMemberStatus.can_invite_users then
invite_users = true else invite_users = false
end
if GetMemberStatus.can_pin_messages then
pin_messages = true else pin_messages = false
end
if GetMemberStatus.can_restrict_members then
restrict_members = true else restrict_members = false
end
if GetMemberStatus.can_promote_members then
promote = true else promote = false
end
return{
SetAdmin = promote,
BanUser = restrict_members,
Invite = invite_users,
PinMsg = pin_messages,
DelMsg = delete_messages,
Info = change_info
}
end
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
function download(url,name)
if not name then
name = url:match('([^/]+)$')
end
if string.find(url,'https') then
data,res = https.request(url)
elseif string.find(url,'http') then
data,res = http.request(url)
else
return 'The link format is incorrect.'
end
if res ~= 200 then
return 'check url , error code : '..res
else
file = io.open(name,'w')
file:write(data)
file:close()
print('Downloaded :> '..name)
return './'..name
end
end
local function Info_Video(x)
local f=io.popen(x)
if f then
local s=f:read"*a"
f:close()
if s == 'a' then
end
return s
end
end
function ChannelJoinch(msg)
JoinChannel = true
local Channel = Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)
if Channel then
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..senderr)
local ChannelJoin = JSON.decode(url)
if ChannelJoin.result.status == "left" then
JoinChannel = false
end
end
return JoinChannel
end
function ChannelJoin(msg)
JoinChannel = true
if not Redis:sismember(Fast.."BotFree:Group:",msg.chat_id) then
local Channel = Redis:get(Fast..'Channel:Join')
if Channel then
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..senderr)
local ChannelJoin = JSON.decode(url)
if ChannelJoin.result.status == "left" then
JoinChannel = false
end
end
end
return JoinChannel
end

function File_Bot_Run(msg,data)  
--var(data)
local msg_chat_id = msg.chat_id
local msg_reply_id = msg.reply_to_message_id
local msg_user_send_id = msg.sender_id.user_id
senderr = msg.sender_id.user_id
local msg_id = msg.id
local text = nil
if msg.reply_to_message_id ~= 0 then
local mrply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if mrply and mrply.sender_id then
rep_idd = mrply.sender_id.user_id or mrply.sender_id.chat_id
else
return false 
end
end
--[[
if msg.content.voice_note and Redis:get(Fast..msg_chat_id.."sound:cmd") then 
local mr = msg.content.voice_note.voice.remote.id
local url = http.request("http://159.223.13.231/oda/voiceRecognise?token="..Token.."&file_id="..mr)
local json = JSON.decode(url)
if json and json.msg then
text = json.msg
print(text)
end --]]
if data.content.text then
xname =  (Redis:get(Fast.."Name:Bot") or "[قيصر]") 
text = data.content.text.text
if text:match("^"..xname.." (.*)$") then
text = text:match("^"..xname.." (.*)$")
end
end


if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end 

if tonumber(senderr) == 2100004938 then
msg.Name_Controller = ' مطور السورس  '
msg.The_Controller = 1
elseif tonumber(senderr) == 1705756127 then
msg.Name_Controller = 'مطور السورس -  '
msg.The_Controller = 1
elseif tonumber(senderr) == 55555555555 then
msg.Name_Controller = 'مطور السورس -  '
msg.The_Controller = 1
elseif tonumber(senderr) == 6430417482 then
msg.Name_Controller = 'مطور السورس -  '
msg.The_Controller = 1
elseif tonumber(senderr) == 5986905034 then
msg.Name_Controller = 'ستك لولا يقلب امك 🌝🤍 '
msg.The_Controller = 1
elseif tonumber(senderr) == 5969871722 then
msg.Name_Controller = 'مطـور السـورس  '
msg.The_Controller = 1
elseif tonumber(senderr) == 627658332 then
msg.Name_Controller = 'مطـور السـورس  '
msg.The_Controller = 1
elseif The_ControllerAll(senderr) == true then  
msg.The_Controller = 1
msg.Name_Controller = 'المطـور الاساسي  '
elseif Redis:sismember(Fast.."Devss:Groups",senderr) == true then
msg.The_Controller = 2
msg.Name_Controller = 'المطـور الثانوي '
elseif Redis:sismember(Fast.."Dev:Groups",senderr) == true then
msg.The_Controller = 3
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Developer:Bot:Reply"..msg.chat_id) or 'المطـــور  '
elseif Redis:sismember(Fast.."Ownerss:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 44
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."PresidentQ:Group:Reply"..msg.chat_id) or 'المــــــالك '
elseif Redis:sismember(Fast.."SuperCreator:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 4
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."President:Group:Reply"..msg.chat_id) or 'المنشئ الاساسي'
elseif Redis:sismember(Fast.."Creator:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 5
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Constructor:Group:Reply"..msg.chat_id) or 'منشئ '
elseif Redis:sismember(Fast.."Manger:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 6
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Manager:Group:Reply"..msg.chat_id) or 'مدير '
elseif Redis:sismember(Fast.."Admin:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 7
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Admin:Group:Reply"..msg.chat_id) or 'ادمن '
elseif Redis:sismember(Fast.."Special:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 8
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Vip:Group:Reply"..msg.chat_id) or 'مميز '
elseif tonumber(senderr) == tonumber(Fast) then
msg.The_Controller = 9
else
msg.The_Controller = 10
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Mempar:Group:Reply"..msg.chat_id) or 'العضـو '
end  
if msg.The_Controller == 1 then  
msg.Asasy = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 then
msg.Devss = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 then
msg.Dev = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 9 then
msg.Ownerss = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 9 then
msg.SuperCreator = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 9 then
msg.Creator = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 9 then
msg.Manger = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 9 then
msg.Admin = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 8 or msg.The_Controller == 9 then
msg.Special = true
end
if text and Redis:get(Fast.."chmembers") == "on" then
if ChannelJoin(msg) == false then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local n = UserInfo.first_name
local d = UserInfo.id
local chinfo = Redis:get(Fast.."Channel:Redis")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
bot.deleteMessages(msg.chat_id,{[1]= msg_id})
return send(msg.chat_id,0,'❍ تنبيه يا ['..n..']('..d..') \n❍ عليك الاشتراك في قناه البوت للتمكن من التحدث هنا\n',"md",false, false, false, false, reply_markup)
end 
end
list_A_files = {"Callback.lua","script.lua","pvbot.lua","rtba.lua"}
if text and text:match("^تعطيل ملف (.*)$") then
if msg.Asasy then
local file = text:match("^تعطيل ملف (.*)$")
if file:match("(.*).lua") then
for k,c in pairs(list_A_files) do
if c == file then
return send(msg.chat_id,msg.id,"↯︙ من الملفات الاساسيه لا يمكن التحكم به")
end
end
for v in io.popen('ls plugin'):lines() do
if v == file then
Redis:sadd(Fast..'files',file)
return send(msg.chat_id,msg.id,"↯︙ تم تعطيل ملف "..file)
end
end
send(msg.chat_id,msg.id,"↯︙ لا يوجد ملف بهذا الاسم")
else
send(msg.chat_id,msg.id,"↯︙ يجيب ان يكون الملف بصيغه lua")
end
else
send(msg.chat_id,msg.id,"↯︙ هذا الامر يخص المطور الاساسي")
end
end

if text and text:match("^تفعيل ملف (.*)$") then
if msg.Asasy then
local file = text:match("^تفعيل ملف (.*)$")
if file:match("(.*).lua") then
for k,c in pairs(list_A_files) do
if c == file then
return send(msg.chat_id,msg.id,"↯︙ من الملفات الاساسيه لا يمكن التحكم به")
end
end
for v in io.popen('ls plugin'):lines() do
if v == file then
Redis:srem(Fast..'files',file)
return send(msg.chat_id,msg.id,"↯︙ تم تفعيل ملف "..file)
end
end
send(msg.chat_id,msg.id,"↯︙ لا يوجد ملف بهذا الاسم")
else
send(msg.chat_id,msg.id,"↯︙ يجيب ان يكون الملف بصيغه lua")
end
else
send(msg.chat_id,msg.id,"↯︙ هذا الامر يخص المطور الاساسي")
end
end
if text == "الملفات" then
if msg.Asasy then
i = 0 
txx = "قائمه ملفاتك (*اضغط علي اسم ملف ليتم نسخه*)\n\n"
for v in io.popen('ls plugin'):lines() do
if Redis:sismember(Fast..'files',v) then
state = "{معطل}"
else 
state = "{مفعل}"
end
i = i +1
txx = txx..i..'- `'..v..'` '..state..'\n'
end
if i < 1 then
send(msg.chat_id,msg.id,"↯︙ لا توجد ملفات","md")
else
send(msg.chat_id,msg.id,txx.."\n\n *يمكنك تفعيل الملف عن طريق امر  (تفعيل ملف + اسم الملف)*","md")
end
else
send(msg.chat_id,msg.id,"↯︙ هذا الامر يخص المطور الاساسي")
end
end

plugins(msg)
src(msg)

if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..text) or Redis:get(Fast.."All:Get:Reides:Commands:Group"..text)
if neww and not Redis:get(Fast.."Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender_id.user_id) then
text = neww or text
end
end
if msg.sender_id.Fastbots ~= "messageSenderChat" then
if Statusrestricted(msg.chat_id,msg.sender_id.user_id).KtmAll == true then
return bot.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Statusrestricted(msg.chat_id,msg.sender_id.user_id).BanAll == true then
return bot.deleteMessages(msg.chat_id,{[1]= msg.id}),bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
elseif Statusrestricted(msg.chat_id,msg.sender_id.user_id).BanGroup == true then
return bot.deleteMessages(msg.chat_id,{[1]= msg.id}),bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
elseif Statusrestricted(msg.chat_id,msg.sender_id.user_id).SilentGroup == true then
return bot.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end
if (Redis:get(Fast..'All:FilterText'..msg_chat_id..':'..msg.sender_id.user_id) == 'DelFilterq') then   
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.Fastbots == "messagePhoto" then
Filters = 'الصوره'
Redis:srem(Fast.."All:List:Filter",'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:del(Fast.."All:Filter:Group:"..msg.content.photo.sizes[1].photo.id)  
elseif msg.content.Fastbots == "messageAnimation" then
Filters = 'المتحركه'
Redis:srem(Fast.."All:List:Filter",'animation:'..msg.content.animation.animation.id)  
Redis:del(Fast.."All:Filter:Group:"..msg.content.animation.animation.id)  
elseif msg.content.Fastbots == "messageSticker" then
Filters = 'الملصق'
Redis:srem(Fast.."All:List:Filter",'sticker:'..msg.content.sticker.sticker.id)  
Redis:del(Fast.."All:Filter:Group:"..msg.content.sticker.sticker.id)  
elseif text then
Redis:srem(Fast.."All:List:Filter",'text:'..text)  
Redis:del(Fast.."All:Filter:Group:"..text)  
Filters = 'النص'
end
Redis:del(Fast..'All:FilterText'..msg_chat_id..':'..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"↯︙ تم الغاء منع عام ("..Filters..")","md",true)  
end
end

if Redis:get(Fast.."Lock:text"..msg_chat_id) and not msg.Special then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end 
if msg.content.Fastbots == "messageChatJoinByLink" and not msg.Special then
if Redis:get(Fast.."Lock:Join"..msg.chat_id) == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end
end
if msg.content.Fastbots == "messageChatAddMembers" then -- اضافه اشخاص
local Lock_Bots = Redis:get(Fast.."Lock:Bot:kick"..msg_chat_id)
for k,v in pairs(msg.content.member_user_ids) do
if tonumber(v) ~= tonumber(Fast) then
local Info_User = bot.getUser(v) 
if Info_User.type.Fastbots == "userTypeBot" then
if Lock_Bots == "del" and not msg.Manger then
bot.setChatMemberStatus(msg.chat_id,v,'banned',0)
elseif Lock_Bots == "kick" and not msg.Manger then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.setChatMemberStatus(msg.chat_id,v,'banned',0)
end
end
end
end
end

if msg.content.Fastbots == "messageChatAddMembers" then
Redis:incr(Fast.."Num:Add:Memp"..msg_chat_id..":"..msg.sender_id.user_id) 
end

if msg.content.Fastbots == "messageChatJoinByLink" or msg.content.Fastbots == "messageChatAddMembers" then
if msg.sender_id.user_id == tonumber(2100004938) then
send(msg_chat_id,msg_id,"مرحبآ بك عزيزي المبرمج محمد نورت الكروب - 🔥","md",true)
end
end
if msg.content.Fastbots == "messageChatJoinByLink" or msg.content.Fastbots == "messageChatAddMembers" then
if msg.sender_id.user_id == tonumber(1705756127) then
send(msg_chat_id,msg_id,"آهلا بك عزيزي المبرمج قتيبه .","md",true)
end
end
if msg.content.Fastbots == "messageChatJoinByLink" or msg.content.Fastbots == "messageChatAddMembers" then
if msg.sender_id.user_id == tonumber(3334445566) then
send(msg_chat_id,msg_id,"آهلا بيك عزيزتي المبرمجه لولا ملكه السورس ❤️‍🔥","md",true)
end
end
if msg.content.Fastbots == "messageChatJoinByLink" or msg.content.Fastbots == "messageChatAddMembers" then
if msg.sender_id.user_id == tonumber(44444444444) then
send(msg_chat_id,msg_id," وسـع وسـع  كينـج صاحب الابلكيشن وآلبــوت وآلسـورس وآهم شـخـصـيآت آلتلي يمـر - ✅","md",true)
end
end
if msg.content.Fastbots == "messageChatJoinByLink" or msg.content.Fastbots == "messageChatAddMembers" then
if Redis:get(Fast.."Status:Welcome"..msg_chat_id) then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local Welcome = Redis:get(Fast.."Welcome:Group"..msg_chat_id)
if Welcome then 
if UserInfo.username then
UserInfousername = '@'..UserInfo.username
else
UserInfousername = 'لا يوجد '
end
Welcome = Welcome:gsub('{الاسم}',(FlterBio(UserInfo.first_name) or '---')) 
Welcome = Welcome:gsub('{المعرف}',("@"..UserInfo.username or '---')) 
Welcome = Welcome:gsub('{الكروب}',(Get_Chat.title or '---')) 
Welcome = Welcome:gsub('{الاعضاء}',Info_Chats.member_count) 
Welcome = Welcome:gsub('{الادمنيه}',Info_Chats.administrator_count) 
Welcome = Welcome:gsub('{الوقت}',os.date("%H:%M:%S")) 
Welcome = Welcome:gsub('{التاريخ}',os.date("%Y/%m/%d")) 
return send(msg_chat_id,msg_id,Welcome,"md")  
else 
local GroupsWelcome = Redis:get(Fast.."Welcome:Groups")
if GroupsWelcome then
GroupsWelcome = GroupsWelcome:gsub('{الاسم}',(FlterBio(UserInfo.first_name) or '---')) 
GroupsWelcome = GroupsWelcome:gsub('{المعرف}',("@"..UserInfo.username or '---')) 
GroupsWelcome = GroupsWelcome:gsub('{الكروب}',(Get_Chat.title or '---')) 
GroupsWelcome = GroupsWelcome:gsub('{الاعضاء}',Info_Chats.member_count) 
GroupsWelcome = GroupsWelcome:gsub('{الادمنيه}',Info_Chats.administrator_count) 
GroupsWelcome = GroupsWelcome:gsub('{الوقت}',os.date("%H:%M:%S")) 
GroupsWelcome = GroupsWelcome:gsub('{التاريخ}',os.date("%Y/%m/%d")) 
local TextWelcome = (GroupsWelcome or '*↯︙نورت يقمر ♥↯︙\n ْ'..(FlterBio(UserInfo.first_name) or '---')..'\n ْ'..(Get_Chat.title or '---')..' \n↯︙ يجب احترام الادمنية\n↯︙ الالتزام بالقوانين في الوصف\n↯︙ الاعضاء '..Info_Chats.member_count..'~ الادمنيه '..Info_Chats.administrator_count..' \n↯︙ وقت الانضمام :('..os.date("%H:%M:%S")..')\n↯︙ تاريخ الانضمام :('..os.date("%Y/%m/%d")..')*\n')
send(msg_chat_id,msg_id,TextWelcome,"md")  
else
local TextWelcome = ('*↯︙نورت يقمر♥\n ْ'..(FlterBio(UserInfo.first_name) or '---')..'\n ْ'..(Get_Chat.title or '---')..' \n↯︙ يجب احترام الادمنية\n↯︙ الالتزام بالقوانين في الوصف\n↯︙ الاعضاء '..Info_Chats.member_count..'~ الادمنيه '..Info_Chats.administrator_count..' \n↯︙ وقت الانضمام :('..os.date("%H:%M:%S")..')\n↯︙ تاريخ الانضمام :('..os.date("%Y/%m/%d")..')*\n')
send(msg_chat_id,msg_id,TextWelcome,"md")  
end
end
end
end 
if not msg.Special and msg.content.Fastbots ~= "messageChatAddMembers" and Redis:hget(Fast.."Spam:Group:User"..msg_chat_id,"Spam:User") then 
if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end
local floods = Redis:hget(Fast.."Spam:Group:User"..msg_chat_id,"Spam:User") or "nil"
local Num_Msg_Max = Redis:hget(Fast.."Spam:Group:User"..msg_chat_id,"Num:Spam") or 5
local post_count = tonumber(Redis:get(Fast.."Spam:Cont"..msg.sender_id.user_id..":"..msg_chat_id) or 0)
if post_count >= tonumber(Redis:hget(Fast.."Spam:Group:User"..msg_chat_id,"Num:Spam") or 5) then 
local type = Redis:hget(Fast.."Spam:Group:User"..msg_chat_id,"Spam:User") 
if type == "kick" then 
return bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0), send(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"↯︙ قام بالتكرار في الكروب وتم طرده").Reply,"md",true)
end
if type == "del" then 
return bot.deleteMessages(msg.chat_id,{[1]= msg.id})
end
if type == "keed" then
return bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0}), send(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"↯︙ قام بالتكرار في الكروب وتم تقييده").Reply,"md",true)  
end
if type == "mute" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,tonumber(msg.sender_id.user_id)) 
return send(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"↯︙ قام بالتكرار في الكروب وتم كتمه").Reply,"md",true)  
end
end
Redis:setex(Fast.."Spam:Cont"..msg.sender_id.user_id..":"..msg_chat_id, tonumber(5), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if Redis:hget(Fast.."Spam:Group:User"..msg_chat_id,"Num:Spam") then
Num_Msg_Max = Redis:hget(Fast.."Spam:Group:User"..msg_chat_id,"Num:Spam") 
end
end 
if text and not msg.Special then
local _nl, ctrl_ = string.gsub(text, "%c", "")  
local _nl, real_ = string.gsub(text, "%d", "")   
sens = 400  
if Redis:get(Fast.."Lock:Spam"..msg.chat_id) == "del" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الكلايش \n ✓',"md")
end
elseif Redis:get(Fast.."Lock:Spam"..msg.chat_id) == "ked" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الكلايش \n ✓',"md")
end
elseif Redis:get(Fast.."Lock:Spam"..msg.chat_id) == "kick" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الكلايش \n ✓',"md")
end
elseif Redis:get(Fast.."Lock:Spam"..msg.chat_id) == "ktm" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,tonumber(msg.sender_id.user_id))
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الكلايش \n ✓',"md")
end
end
end
if msg.forward_info and not msg.Admin then -- التوجيه
local Fwd_Group = Redis:get(Fast.."Lock:forward"..msg_chat_id)
if Fwd_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال التوجيه \n ✓',"md")
end
elseif Fwd_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال التوجيه \n ✓',"md")
end
elseif Fwd_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,tounmber(msg.sender_id.user_id)) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال التوجيه \n ✓',"md")
end
elseif Fwd_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال التوجيه \n ✓',"md")
end
end

return false
end 
if msg.content.Fastbots == "messagePhoto" or msg.content.Fastbots == "messageAnimation" or msg.content.Fastbots == "messageSticker" or msg.content.Fastbots == "messageVoiceNote" or msg.content.Fastbots == "messageVideo" or msg.content.Fastbots == "messageAudio" or msg.content.Fastbots == "messageVideoNote" then
if not msg.Admin then
if Redis:get(Fast.."Lock:AlUasat"..msg_chat_id) then 
return bot.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end
end

if msg.reply_markup and msg.reply_markup.Fastbots == "replyMarkupInlineKeyboard" then
if not msg.Special then  -- الكيبورد
local Keyboard_Group = Redis:get(Fast.."Lock:Keyboard"..msg_chat_id)
if Keyboard_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الكيبورد \n ✓',"md")
end
elseif Keyboard_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الكيبورد \n ✓',"md")
end
elseif Keyboard_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,toumber(msg.sender_id.user_id)) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الكيبورد \n ✓',"md")
end
elseif Keyboard_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الكيبورد \n ✓',"md")
end
end
end

end 

if msg.content.location and not msg.Special then  -- الموقع
if location then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال المواقع \n ✓',"md")
end
end

end 

if msg.content.entities and msg..content.entities[0] and msg.content.entities[0].type.Fastbots == "textEntityTypeUrl" and not msg.Special then  -- الماركداون
local Markduan_Gtoup = Redis:get(Fast.."Lock:Markdaun"..msg_chat_id)
if Markduan_Gtoup == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الماركداون \n ✓',"md")
end
elseif Markduan_Gtoup == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الماركداون \n ✓',"md")
end
elseif Markduan_Gtoup == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,tonumber(msg.sender_id.user_id)) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الماركداون \n ✓',"md")
end
elseif Markduan_Gtoup == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الماركداون \n ✓',"md")
end
end

end 

if msg.content.game and not msg.Special then  -- الالعاب
local Games_Group = Redis:get(Fast.."Lock:geam"..msg_chat_id)
if Games_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الالعاب \n ✓',"md")
end
elseif Games_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الالعاب \n ✓',"md")
end
elseif Games_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الالعاب \n ✓',"md")
end
elseif Games_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الالعاب \n ✓',"md")
end
end

end 
if msg.content.Fastbots == "messagePinMessage" then -- رساله التثبيت
local Pin_Msg = Redis:get(Fast.."lockpin"..msg_chat_id)
if Pin_Msg and not msg.Manger then
if Pin_Msg:match("(%d+)") then 
local PinMsg = bot.pinChatMessage(msg_chat_id,Pin_Msg,true)
if PinMsg.Fastbots~= "ok" then
return send(msg_chat_id,msg_id,"\n↯︙ لا استطيع تثبيت الرسائل ليست لديه صلاحيه","md",true)
end
end
local UnPin = bot.unpinChatMessage(msg_chat_id) 
if UnPin.Fastbots ~= "ok" then
return send(msg_chat_id,msg_id,"\n↯︙ لا استطيع الغاء تثبيت الرسائل ليست لديه صلاحيه","md",true)
end
return send(msg_chat_id,msg_id,"\n↯︙ التثبيت معطل من قبل المدراء ","md",true)
end

end 

if msg.content.Fastbots == "messageChatJoinByLink" then
if Redis:get(Fast.."Lock:Join"..msg.chat_id) == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end
end

if msg.content.Fastbots == "messageChatDeleteMember" and not Redis:get(Fast.."spammkick"..msg.chat_id) then 
if msg.sender_id.user_id ~= Fast then
Num_Msg_Max = 4
local UserInfo = bot.getUser(msg.sender_id.user_id)
local names = FlterBio(UserInfo.first_name)
local monsha = Redis:smembers(Fast.."Ownerss:Group"..msg_chat_id) 
if Redis:ttl(Fast.."mkal:setex:" .. msg.chat_id .. ":" .. msg.sender_id.user_id) < 0 then
Redis:del(Fast.."delmembars"..msg.chat_id..msg.sender_id.user_id)
end
local ttsaa = (Redis:get(Fast.."delmembars"..msg.chat_id..msg.sender_id.user_id) or 0)
if tonumber(ttsaa) >= tonumber(3) then 
local type = Redis:hget(Fast.."Storm:Spam:Group:User"..msg.chat_id,"Spam:User") 
local removeMembars = https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. msg.chat_id .. "&user_id=" ..msg.sender_id.user_id.."&can_change_info=false&can_manage_chat=false&can_manage_voice_chats=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
local Json_Info = JSON.decode(removeMembars)
Redis:srem(Fast.."SuperCreator:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Creator:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Manger:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Admin:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Special:Group"..msg.chat_id,msg.sender_id.user_id)
if Json_Info.ok == false and Json_Info.error_code == 400 and Json_Info.description == "Bad Request: CHAT_ADMIN_REQUIRED" then
if #monsha ~= 0 then 
local ListMembers = '\n*↯︙ تاك للمالكين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local v = monsha[1]
local tecxt = ListMembers.."\n↯︙ نداء للمالك {[ > Click < ](tg://user?id="..v..")}"..
"\n↯︙ المشرف {["..names.." ](tg://user?id="..msg.sender_id.user_id..")}"..
"\n↯︙ قام بالتكرار في ازاله الاعضاء \n↯︙ لا يمكنني تنزيله من المشرفين"
send(msg_chat_id,msg_id,tecxt,"md")
end
end
if Json_Info.ok == false and Json_Info.error_code == 400 and Json_Info.description == "Bad Request: can't remove chat owner" then
if #monsha ~= 0 then 
local ListMembers = '\n*↯︙ تاك للمالكين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local tecxt = ListMembers.."\n↯︙ نداء للمالك {[ > Click < ](tg://user?id="..v..")}"..
"\n↯︙ المشرف {["..names.." ](tg://user?id="..msg.sender_id.user_id..")}"..
"\n↯︙ هناك عمليه تخريب وطرد الاعضاء , ليست لدي صلاحيه اضافه مشرفين لتنزيله"
send(msg_chat_id,msg_id,tecxt,"md")
end
end
if Json_Info.ok == true and Json_Info.result == true then
if #monsha ~= 0 then 
local ListMembers = '\n*↯︙ تاك للمالكين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local v = monsha[1]
local tecxt = ListMembers.."\n↯︙ نداء للمالك {[ > Click < ](tg://user?id="..v..")}"..
"\n↯︙ المشرف {["..names.." ](tg://user?id="..msg.sender_id.user_id..")}"..
"\n↯︙ قام بتكرار طرد الاعضاء وطرد اكثر من 3 وتم تنزيله من المشرفين "
send(msg_chat_id,msg_id,tecxt,"md")
end
end
Redis:del(Fast.."delmembars"..msg.chat_id..msg.sender_id.user_id)
end
Redis:setex(Fast.."mkal:setex:" .. msg.chat_id .. ":" .. msg.sender_id.user_id, 3600, true) 
Redis:incrby(Fast.."delmembars"..msg.chat_id..msg.sender_id.user_id, 1)  
end
end 

if text and text:match('طرد @(.*)') or text and text:match('حظر @(.*)') or text and text:match('طرد (%d+)') or text and text:match('حظر (%d+)') then 
if not Redis:get(Fast.."spammkick"..msg.chat_id) then 
if msg.sender_id.user_id ~= Fast then
Num_Msg_Max = 4
local UserInfo = bot.getUser(msg.sender_id.user_id)
local names = FlterBio(UserInfo.first_name) 
local monsha = Redis:smembers(Fast.."Ownerss:Group"..msg_chat_id) 
if Redis:ttl(Fast.."qmkal:setex:" .. msg.chat_id .. ":" .. msg.sender_id.user_id) < 0 then
Redis:del(Fast.."qdelmembars"..msg.chat_id..msg.sender_id.user_id)
end
local ttsaa = (Redis:get(Fast.."qdelmembars"..msg.chat_id..msg.sender_id.user_id) or 0)
if tonumber(ttsaa) >= tonumber(5) then 
local removeMembars = https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. msg.chat_id .. "&user_id=" ..msg.sender_id.user_id.."&can_change_info=false&can_manage_chat=false&can_manage_voice_chats=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
local Json_Info = JSON.decode(removeMembars)
Redis:srem(Fast.."SuperCreator:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Creator:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Manger:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Admin:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Special:Group"..msg.chat_id,msg.sender_id.user_id)
if Json_Info.ok == false and Json_Info.error_code == 400 and Json_Info.description == "Bad Request: CHAT_ADMIN_REQUIRED" then
if #monsha ~= 0 then 
local ListMembers = '\n*↯︙ تاك للمالكين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local tecxt = ListMembers.."\n↯︙ المشرف {["..names.." ](tg://user?id="..msg.sender_id.user_id..")}"..
"\n↯︙ قام بالتكرار في ازاله الاعضاء \n↯︙ لا يمكنني تنزيله من المشرفين"
send(msg_chat_id,msg_id,tecxt,"md")
end
end
if Json_Info.ok == false and Json_Info.error_code == 400 and Json_Info.description == "Bad Request: can't remove chat owner" then
if #monsha ~= 0 then 
local ListMembers = '\n*↯︙ تاك للمالكين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local tecxt = ListMembers.."\n↯︙ المشرف {["..names.." ](tg://user?id="..msg.sender_id.user_id..")}"..
"\n↯︙ هناك عمليه تخريب وطرد الاعضاء , ليست لدي صلاحيه اضافه مشرفين لتنزيله"
send(msg_chat_id,msg_id,tecxt,"md")
end
end
if Json_Info.ok == true and Json_Info.result == true then
if #monsha ~= 0 then 
local ListMembers = '\n*↯︙ تاك للمالكين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local tecxt = ListMembers.."\n↯︙ المشرف {["..names.." ](tg://user?id="..msg.sender_id.user_id..")}"..
"\n↯︙ هناك عمليه تخريب وطرد الاعضاء , ليست لدي صلاحيه اضافه مشرفين لتنزيله"
send(msg_chat_id,msg_id,tecxt,"md")
end
end
Redis:del(Fast.."qdelmembars"..msg.chat_id..msg.sender_id.user_id)
end
Redis:setex(Fast.."qmkal:setex:" .. msg.chat_id .. ":" .. msg.sender_id.user_id, 3600, true) 
Redis:incrby(Fast.."qdelmembars"..msg.chat_id..msg.sender_id.user_id, 1)  
end
end 
end

if msg.content.Fastbots == "messagePhoto" and Redis:get(Fast..'welcom_ph:witting'..msg.sender_id.user_id) then  -- الصور
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast..':WELCOME_BOT',idPhoto)
Redis:del(Fast..'welcom_ph:witting'..msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, '↯︙ تم تغيير صـورهہ‏‏ آلترحيب للبوت\n✓')
end

if msg.content.Fastbots == "messageChatAddMembers" then -- اضافه اشخاص

Redis:incr(Fast.."Num:Add:Memp"..msg_chat_id..":"..msg.sender_id.user_id) 
local AddMembrs = Redis:get(Fast.."Lock:AddMempar"..msg_chat_id) 
local Lock_Bots = Redis:get(Fast.."Lock:Bot:kick"..msg_chat_id)
for k,v in pairs(msg.content.member_user_ids) do
if tonumber(v) == tonumber(Fast) then
local idephoto = Redis:get(Fast..':WELCOME_BOT')
if idephoto then
local Bot_Name = (Redis:get(Fast.."Name:Bot") or "[بروكس]")
return bot.sendPhoto(msg.chat_id, msg.id, idephoto,
'\n*↯︙ اهلا انآ بوت اسمي '..Bot_Name..''..
'\n↯︙ آختصـآصـي حمـآيهہ‌‏ آلمـجمـوعآت'..
'\n↯︙ مـن آلسـبآم وآلتوجيهہ‌‏ وآلتگرآر وآلخ...'..
'\n↯︙ مـعـرف الـمـطـور  : @'..UserSudo..
'*', "md")
end
end
local Info_User = bot.getUser(v) 
if Info_User.type.Fastbots == "userTypeRegular" then
Redis:incr(Fast.."Num:Add:Memp"..msg.chat_id..":"..msg.sender_id.user_id) 
if AddMembrs == "kick" and not msg.Special then
bot.setChatMemberStatus(msg.chat_id,v,'banned',0)
end
end
end
end 


if msg.content.Fastbots == "messageContact" and not msg.Special then  -- الجهات
local Contact_Group = Redis:get(Fast.."Lock:Contact"..msg_chat_id)
if Contact_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الجهات \n ✓',"md")
end
elseif Contact_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الجهات \n ✓',"md")
end
elseif Contact_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الجهات \n ✓',"md")
end
elseif Contact_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الجهات \n ✓',"md")
end
end

end 

if msg.content.Fastbots == "messageVideoNote" and not msg.Special then  -- بصمه الفيديو
local Videonote_Group = Redis:get(Fast.."Lock:Unsupported"..msg_chat_id)
if Videonote_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال بصمات الفيديو \n ✓',"md")
end
elseif Videonote_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال بصمات الفيديو  \n ✓',"md")
end
elseif Videonote_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال بصمات الفيديو  \n ✓',"md")
end
elseif Videonote_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال بصمات الفيديو  \n ✓',"md")
end
end

end 

if msg.content.Fastbots == "messageDocument" and not msg.Special then  -- الملفات
local Document_Group = Redis:get(Fast.."Lock:Document"..msg_chat_id)
if Document_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الملفات \n ✓',"md")
end
elseif Document_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الملفات \n ✓',"md")
end
elseif Document_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الملفات \n ✓',"md")
end
elseif Document_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الملفات \n ✓',"md")
end
end

end 

if msg.content.Fastbots == "messageAudio" and not msg.Special then  -- الملفات الصوتيه
local Audio_Group = Redis:get(Fast.."Lock:Audio"..msg_chat_id)
if Audio_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الصوتيات \n ✓',"md")
end
elseif Audio_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الصوتيات \n ✓',"md")
end
elseif Audio_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الصوتيات \n ✓',"md")
end
elseif Audio_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الصوتيات \n ✓',"md")
end
end

end 

if msg.content.Fastbots == "messageVideo" then  -- الفيديو
if Redis:sismember(Fast.."Specialall:Group",msg.sender_id.user_id) then
testmod = true
elseif msg.Special then
testmod = true
else
testmod = false
end
if testmod == false then
local Video_Grouo = Redis:get(Fast.."Lock:Video"..msg_chat_id)
if Video_Grouo == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الفيديو \n ✓',"md")
end
elseif Video_Grouo == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الفيديو \n ✓',"md")
end
elseif Video_Grouo == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الفيديو \n ✓',"md")
end
elseif Video_Grouo == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الفيديو \n ✓',"md")
end
end
end

end 
if text and text:match("[A-Z]") or text and text:match("[a-z]") then
if not msg.Special and Redis:get(Fast.."Lock:english"..msg_chat_id) then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال كلمات انكليزيه \n ✓',"md")
end
end
end
if msg.content.Fastbots == "messageVoiceNote" and not msg.Special then  -- البصمات
local Voice_Group = Redis:get(Fast.."Lock:vico"..msg_chat_id)
if Voice_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال البصمات \n ✓',"md")
end
elseif Voice_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال البصمات \n ✓',"md")
end
elseif Voice_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال البصمات \n ✓',"md")
end
elseif Voice_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال البصمات \n ✓',"md")
end
end

end 

if msg.content.Fastbots == "messageSticker" then  -- الملصقات
if Redis:sismember(Fast.."Specialall:Group",msg.sender_id.user_id) then
testmod = true
elseif msg.Special then
testmod = true
else
testmod = false
end
if testmod == false then
local Sticker_Group = Redis:get(Fast.."Lock:Sticker"..msg_chat_id)
if Sticker_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الملصقات \n ✓',"md")
end
elseif Sticker_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الملصقات \n ✓',"md")
end
elseif Sticker_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الملصقات \n ✓',"md")
end
elseif Sticker_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الملصقات \n ✓',"md")
end
end
end

end 

if msg.via_bot_user_id ~= 0 and not msg.Admin then  -- انلاين
local Inlen_Group = Redis:get(Fast.."Lock:Inlen"..msg_chat_id)
if Inlen_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الاونلاين \n ✓',"md")
end
elseif Inlen_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الاونلاين \n ✓',"md")
end
elseif Inlen_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الاونلاين \n ✓',"md")
end
elseif Inlen_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الاونلاين \n ✓',"md")
end
end

end

if msg.content.Fastbots == "messageAnimation"  then  -- المتحركات
if Redis:sismember(Fast.."Specialall:Group",msg.sender_id.user_id) then
testmod = true
elseif msg.Special then
testmod = true
else
testmod = false
end
if testmod == false then
local Gif_group = Redis:get(Fast.."Lock:Animation"..msg_chat_id)
if Gif_group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال المتحركات \n ✓',"md")
end
elseif Gif_group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال المتحركات \n ✓',"md")
end
elseif Gif_group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال المتحركات \n ✓',"md")
end
elseif Gif_group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال المتحركات \n ✓',"md")
end
end
end

end 
if text and (text:match("ه‍") or text:match("ی") or text:match("ک")) and not msg.Special then 
local phshar_Group = Redis:get(Fast.."Lock:farsia"..msg_chat_id)
if phshar_Group then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الفارسيه \n ✓',"md")
end
end
end
if text and (text:match("كسمك") or text:match("منيوج") or text:match("عير") or text:match("منيوك") or text:match("طويز") or text:match("العيوره") or text:match("مناويج") or text:match("عيوره") or text:match("كسج") or text:match("sex") or text:match("نيج")  or text:match("كحاب")  or text:match("طيازه")or text:match("طيز")or text:match("كس") or text:match("زب") or text:match("نيك") or text:match("فرخ") or text:match("كحبه") or text:match("انيكك") or text:match("منيوك")) and not msg.Special then 
local phshar_Group = Redis:get(Fast.."Lock:phshar"..msg_chat_id)
if phshar_Group then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الفشار \n ✓',"md")
end
end
end
if text and (text:match("خره بالله") or text:match("خبربك") or text:match("كسدينربك") or text:match("خرب بالله") or text:match("خرب الله") or text:match("خره بربك") or text:match("الله الكواد") or text:match("خره بمحمد") or text:match("كسم الله") or text:match("كسم ربك") or text:match("كسربك") or text:match("كسختالله") or text:match("كسخت الله") or text:match("خره بدينك") or text:match("خرهبدينك") or text:match("كسالله") or text:match("خربالله")) and not msg.Special then 
local phsharr_Group = Redis:get(Fast.."Lock:alkfr"..msg_chat_id)
if phsharr_Group then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الكفر \n ✓',"md")
end
end
end
if msg.content.Fastbots == "messagePhoto" then  -- الصور
if Redis:sismember(Fast.."Specialall:Group",msg.sender_id.user_id) then
testmod = true
elseif msg.Special then
testmod = true
else
testmod = false
end
if testmod == false then
local Photo_Group = Redis:get(Fast.."Lock:Photo"..msg_chat_id)
if Photo_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الصور \n ✓',"md")
end
elseif Photo_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الصور \n ✓',"md")
end
elseif Photo_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الصور \n ✓',"md")
end
elseif Photo_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الصور \n ✓',"md")
end
end
end

end
if msg.content.photo and Redis:get(Fast.."Chat:Photo"..msg_chat_id..":"..msg.sender_id.user_id) then
local ChatPhoto = bot.setChatPhoto(msg_chat_id,msg.content.photo.sizes[2].photo.remote.id)
if (ChatPhoto.Fastbots == "error") then
Redis:del(Fast.."Chat:Photo"..msg_chat_id..":"..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"↯︙ لا استطيع تغيير صوره الكروب لاني لست ادمن او ليست لديه الصلاحيه ","md",true)    
end
Redis:del(Fast.."Chat:Photo"..msg_chat_id..":"..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"↯︙ تم تغيير صوره الكروب بنـجاح ","md",true)    
end
if  (text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or text and text:match("[Tt].[Mm][Ee]/") 
or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or text and text:match(".[Pp][Ee]")  
or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or text and text:match("[Hh][Tt][Tt][Pp]://") 
or text and text:match("[Ww][Ww][Ww].") 
or text and text:match(".[Cc][Oo][Mm]")) or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match(".[Tt][Kk]") or text and text:match(".[Mm][Ll]") or text and text:match(".[Oo][Rr][Gg]")
or msg.content.Fastbots == "messageContact" 
or msg.content.Fastbots == "messageSticker"
or msg.content.Fastbots == "messageVideoNote" 
or msg.content.Fastbots == "messageDocument" 
or msg.content.Fastbots == "messageAudio" 
or msg.content.Fastbots == "messageVideo" 
or msg.content.Fastbots == "messageVoiceNote" 
or msg.content.Fastbots == "messageAnimation" 
or msg.content.Fastbots == "messagePhoto" then
local tphlesh_Group = Redis:get(Fast.."Lock:tphlesh"..msg_chat_id)
if not msg.Special and tphlesh_Group then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ عذرا التفليش مقفل تم المسح \n ✓',"md")
end
end
end

if (text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or text and text:match("[Tt].[Mm][Ee]/") 
or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or text and text:match(".[Pp][Ee]") 
or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or text and text:match("[Hh][Tt][Tt][Pp]://") 
or text and text:match("[Ww][Ww][Ww].") 
or text and text:match(".[Cc][Oo][Mm]")) or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match(".[Tt][Kk]") or text and text:match(".[Mm][Ll]") or text and text:match(".[Oo][Rr][Gg]") then 
local link_Group = Redis:get(Fast.."Lock:Link"..msg_chat_id)  
if not msg.Admin then
if link_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الروابط \n ✓',"md")
end
elseif link_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الروابط \n ✓',"md")
end
elseif link_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الروابط \n ✓',"md")
end
elseif link_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الروابط \n ✓',"md")
end
end

return false
end
end
if text and text:match("@[%a%d_]+") then 
if Redis:sismember(Fast.."Specialall:Group",msg.sender_id.user_id) then
testmod = true
elseif msg.Special then
testmod = true
else
testmod = false
end
if testmod == false then
local UserName_Group = Redis:get(Fast.."Lock:User:Name"..msg_chat_id)
if UserName_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال المعرفات \n ✓',"md")
end
elseif UserName_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال المعرفات \n ✓',"md")
end
elseif UserName_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال المعرفات \n ✓',"md")
end
elseif UserName_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال المعرفات \n ✓',"md")
end
end

end
end
if text and text:match("#[%a%d_]+") and not msg.Special then 
local Hashtak_Group = Redis:get(Fast.."Lock:hashtak"..msg_chat_id)
if Hashtak_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الهاشتاك \n ✓',"md")
end
elseif Hashtak_Group == "ked" then
 bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
 bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الهاشتاك \n ✓',"md")
end
elseif Hashtak_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الهاشتاك \n ✓',"md")
end
elseif Hashtak_Group == "kick" then
 bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
 bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الهاشتاك \n ✓',"md")
end
end

end
if text and text:match("^/(.*)$") and not msg.Special then 
local comd_Group = Redis:get(Fast.."Lock:Cmd"..msg_chat_id)
if comd_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الشارحه \n ✓',"md")
end
elseif comd_Group == "ked" then
 bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
 bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الشارحه \n ✓',"md")
end
elseif comd_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الشارحه \n ✓',"md")
end
elseif comd_Group == "kick" then
 bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
 bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "↯︙ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "↯︙ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "↯︙ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "↯︙ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '↯︙ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'↯︙ ممنوع ارسال الشارحه \n ✓',"md")
end
end
end
if (Redis:get(Fast..'FilterText'..msg_chat_id..':'..msg.sender_id.user_id) == 'true') then
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
Filters = 'صوره'
Redis:sadd(Fast.."List:Filter"..msg_chat_id,'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:set(Fast.."Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, msg.content.photo.sizes[1].photo.id)  
elseif msg.content.animation then
Filters = 'متحركه'
Redis:sadd(Fast.."List:Filter"..msg_chat_id,'animation:'..msg.content.animation.animation.id)  
Redis:set(Fast.."Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, msg.content.animation.animation.id)  
elseif msg.content.sticker then
Filters = 'ملصق'
Redis:sadd(Fast.."List:Filter"..msg_chat_id,'sticker:'..msg.content.sticker.sticker.id)  
Redis:set(Fast.."Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, msg.content.sticker.sticker.id)  
elseif text then
Redis:set(Fast.."Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, text)  
Redis:sadd(Fast.."List:Filter"..msg_chat_id,'text:'..text)  
Filters = 'نص'
end
Redis:set(Fast..'FilterText'..msg_chat_id..':'..msg.sender_id.user_id,'true1')
return send(msg_chat_id,msg_id,"\n↯︙ ارسل تحذير ( "..Filters.." ) عند ارساله","md",true)  
end
end
if text and (Redis:get(Fast..'FilterText'..msg_chat_id..':'..msg.sender_id.user_id) == 'true1') then
local Text_Filter = Redis:get(Fast.."Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id)  
if Text_Filter then   
Redis:set(Fast.."Filter:Group:"..Text_Filter..msg_chat_id,text)  
end  
Redis:del(Fast.."Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id)  
Redis:del(Fast..'FilterText'..msg_chat_id..':'..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"\n↯︙ تم اضافه رد التحذير","md",true)  
end
if (Redis:get(Fast..'FilterText'..msg_chat_id..':'..msg.sender_id.user_id) == 'DelFilter') then   
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
Filters = 'الصوره'
Redis:srem(Fast.."List:Filter"..msg_chat_id,'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:del(Fast.."Filter:Group:"..msg.content.photo.sizes[1].photo.id..msg_chat_id)  
elseif msg.content.animation then
Filters = 'المتحركه'
Redis:srem(Fast.."List:Filter"..msg_chat_id,'animation:'..msg.content.animation.animation.id)  
Redis:del(Fast.."Filter:Group:"..msg.content.animation.animation.id..msg_chat_id)  
elseif msg.content.sticker then
Filters = 'الملصق'
Redis:srem(Fast.."List:Filter"..msg_chat_id,'sticker:'..msg.content.sticker.sticker.id)  
Redis:del(Fast.."Filter:Group:"..msg.content.sticker.sticker.id..msg_chat_id)  
elseif text then
Redis:srem(Fast.."List:Filter"..msg_chat_id,'text:'..text)  
Redis:del(Fast.."Filter:Group:"..text..msg_chat_id)  
Filters = 'النص'
end
Redis:del(Fast..'FilterText'..msg_chat_id..':'..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"↯︙ تم الغاء منع ("..Filters..")","md",true)  
end
end
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
DelFilters = msg.content.photo.sizes[1].photo.id
statusfilter = 'الصوره'
elseif msg.content.animation then
DelFilters = msg.content.animation.animation.id
statusfilter = 'المتحركه'
elseif msg.content.sticker then
DelFilters = msg.content.sticker.sticker.id
statusfilter = 'الملصق'
elseif text then
DelFilters = text
statusfilter = 'الرساله'
end
local ReplyFilters = Redis:get(Fast.."Filter:Group:"..DelFilters..msg_chat_id)
if ReplyFilters and not msg.Special then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
return send(msg_chat_id,msg_id,"*↯︙ لقد تم منع هذه ( "..statusfilter.." ) هنا*\n↯︙ "..ReplyFilters,"md",true)   
end
end
if text and Redis:get(Fast..msg.chat_id..msg.sender_id.user_id.."replace") == "true1" then
Redis:del(Fast..msg.chat_id..msg.sender_id.user_id.."replace")
local word = Redis:get(Fast..msg.sender_id.user_id.."word")
Redis:set(Fast.."Word:Replace"..word,text)
Redis:sadd(Fast..'Words:r',word)  
bot.sendText(msg_chat_id,msg_id,"↯︙ تم حفظ الكلمه","md",true)  
return false 
end
if text and Redis:get(Fast..msg.chat_id..msg.sender_id.user_id.."replace") == "true" then
Redis:set(Fast..msg.sender_id.user_id.."word",text)
Redis:set(Fast..msg.chat_id..msg.sender_id.user_id.."replace","true1")
bot.sendText(msg_chat_id,msg_id,'\n↯︙ ارسل كلمه جديده ليتم استبدالها مكان *'..text..'*',"md",true)  
return false 
end
if text and Redis:get(Fast.."Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender_id.user_id) == "true" then
local NewCmmd = Redis:get(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if NewCmmd then
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..text)
Redis:del(Fast.."Command:Reids:Group:New"..msg_chat_id)
Redis:srem(Fast.."Command:List:Group"..msg_chat_id,text)
send(msg_chat_id,msg_id,"↯︙ تم ازالة هذا الامر ↫ { "..text.." }","md",true)
else
send(msg_chat_id,msg_id,"↯︙ لا يوجد امر بهذا الاسم","md",true)
end
Redis:del(Fast.."Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender_id.user_id)
return false
end
if text and Redis:get(Fast.."Command:Reids:Group"..msg_chat_id..":"..msg.sender_id.user_id) == "true" then
Redis:set(Fast.."Command:Reids:Group:New"..msg_chat_id,text)
Redis:del(Fast.."Command:Reids:Group"..msg_chat_id..":"..msg.sender_id.user_id)
Redis:set(Fast.."Command:Reids:Group:End"..msg_chat_id..":"..msg.sender_id.user_id,"true1") 
return send(msg_chat_id,msg_id,"↯︙ ارسل الامر الجديد ليتم وضعه مكان القديم","md",true)  
end
if text and Redis:get(Fast.."Command:Reids:Group:End"..msg_chat_id..":"..msg.sender_id.user_id) == "true1" then
local NewCmd = Redis:get(Fast.."Command:Reids:Group:New"..msg_chat_id)
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..text,NewCmd)
Redis:sadd(Fast.."Command:List:Group"..msg_chat_id,text)
Redis:del(Fast.."Command:Reids:Group:End"..msg_chat_id..":"..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"↯︙ تم حفظ الامر باسم ↫ { "..text..' }',"md",true)
end
if Redis:get(Fast.."Set:Link"..msg_chat_id..""..msg.sender_id.user_id) then
if text == "الغاء" then
Redis:del(Fast.."Set:Link"..msg_chat_id..""..msg.sender_id.user_id) 
return send(msg_chat_id,msg_id,"↯︙ تم الغاء حفظ الرابط","md",true)         
end
if text and text:match("(https://telegram.me/joinchat/%S+)") or text and text:match("(https://t.me/joinchat/%S+)") then     
local LinkGroup = text:match("(https://telegram.me/joinchat/%S+)") or text:match("(https://t.me/joinchat/%S+)")   
Redis:set(Fast.."Group:Link"..msg_chat_id,LinkGroup)
Redis:del(Fast.."Set:Link"..msg_chat_id..""..msg.sender_id.user_id) 
return send(msg_chat_id,msg_id,"↯︙ تم حفظ الرابط بنجاح","md",true)         
end
end 
if Redis:get(Fast.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender_id.user_id) then 
if text == "الغاء" then 
Redis:del(Fast.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender_id.user_id)  
return send(msg_chat_id,msg_id,"↯︙ تم الغاء حفظ الترحيب","md",true)   
end 
Redis:del(Fast.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender_id.user_id)  
Redis:set(Fast.."Welcome:Group"..msg_chat_id,text) 
return send(msg_chat_id,msg_id,"↯︙ تم حفظ ترحيب الكروب","md",true)     
end
if Redis:get(Fast.."Set:Rules:" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" then 
Redis:del(Fast.."Set:Rules:" .. msg_chat_id .. ":" .. msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"↯︙ تم الغاء حفظ القوانين","md",true)   
end 
Redis:set(Fast.."Group:Rules" .. msg_chat_id,text) 
Redis:del(Fast.."Set:Rules:" .. msg_chat_id .. ":" .. msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"↯︙ تم حفظ قوانين الكروب","md",true)  
end  
if Redis:get(Fast.."Set:Description:" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" then 
Redis:del(Fast.."Set:Description:" .. msg_chat_id .. ":" .. msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"↯︙ تم الغاء حفظ وصف الكروب","md",true)   
end 
bot.setChatDescription(msg_chat_id,text) 
Redis:del(Fast.."Set:Description:" .. msg_chat_id .. ":" .. msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"↯︙ تم حفظ وصف الكروب","md",true)  
end  

if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local test = Redis:get(Fast.."Text:Manager"..msg.sender_id.user_id..":"..msg_chat_id.."")
if Redis:get(Fast.."Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id) == "true1" then
Redis:del(Fast.."Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id)
if msg.content.sticker then   
Redis:set(Fast.."Add:Rd:Manager:Stekrs"..test..msg_chat_id, msg.content.sticker.sticker.remote.id)  
end   
if msg.content.voice_note then  
Redis:set(Fast.."Add:Rd:Manager:Vico"..test..msg_chat_id, msg.content.voice_note.voice.remote.id)  
end   
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Fast.."Add:Rd:Manager:Text"..test..msg_chat_id, text)  
end  
if msg.content.audio then
if msg.content.caption.text then
Redis:set(Fast.."Add:Rd:caption:audio"..msg.content.audio.audio.remote.id..msg_chat_id, msg.content.caption.text)  
end
Redis:set(Fast.."Add:Rd:Manager:Audio"..test..msg_chat_id, msg.content.audio.audio.remote.id)  
end
if msg.content.document then
if msg.content.caption.text then
Redis:set(Fast.."Add:Rd:caption:document"..msg.content.document.document.remote.id..msg_chat_id, msg.content.caption.text)  
end
Redis:set(Fast.."Add:Rd:Manager:File"..test..msg_chat_id, msg.content.document.document.remote.id)  
end
if msg.content.animation then
Redis:set(Fast.."Add:Rd:Manager:Gif"..test..msg_chat_id, msg.content.animation.animation.remote.id)  
end
if msg.content.video_note then
Redis:set(Fast.."Add:Rd:Manager:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  
end
if msg.content.video then
if msg.content.caption.text then
Redis:set(Fast.."Add:Rd:caption:video"..msg.content.video.video.remote.id..msg_chat_id, msg.content.caption.text)  
end
Redis:set(Fast.."Add:Rd:Manager:Video"..test..msg_chat_id, msg.content.video.video.remote.id)  
end
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
if msg.content.caption.text then
Redis:set(Fast.."Add:Rd:caption:Photo"..idPhoto..msg_chat_id, msg.content.caption.text)  
end
Redis:set(Fast.."Add:Rd:Manager:Photo"..test..msg_chat_id, idPhoto)  
end
return send(msg_chat_id,msg_id,"↯︙ تم حفظ الرد  بنجاح \n↯︙ ارسل ( ["..test.."] ) لعرض الرد","md",true)  
end  
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id) == "true" then
Redis:set(Fast.."Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id,"true1")
Redis:set(Fast.."Text:Manager"..msg.sender_id.user_id..":"..msg_chat_id, text)
Redis:del(Fast.."Add:Rd:Manager:Gif"..text..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Vico"..text..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
Redis:del(Fast.."Add:Rd:Manager:Text"..text..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Photo"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio"..text..msg_chat_id)
Redis:sadd(Fast.."List:Manager"..msg_chat_id.."", text)
send(msg_chat_id,msg_id,[[
↯︙ارسل محتوى الرد الان .
يمكنك استخدام ⦗ ملف . صوره . فيديو . بصمه . ملف صوتي . بصمه فيديو . رساله . ملصق . متحركه ⦘ 
↯︙يمكنك اضافة التالي  .
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)  
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id.."") == "true2" then
Redis:del(Fast.."Add:Rd:Manager:Gif"..text..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Vico"..text..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
Redis:del(Fast.."Add:Rd:Manager:Text"..text..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Photo"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note"..text..msg_chat_id)
Redis:del(Fast.."Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id)
Redis:srem(Fast.."List:Manager"..msg_chat_id.."", text)
send(msg_chat_id,msg_id,"↯︙ تم مسح الرد من الردود المضافه","md",true)  
return false
end
end
if text and Redis:get(Fast.."Status:ReplySudo"..msg_chat_id) then
local anemi = Redis:get(Fast.."Add:Rd:Sudo:Gif"..text)   
local veico = Redis:get(Fast.."Add:Rd:Sudo:vico"..text)   
local stekr = Redis:get(Fast.."Add:Rd:Sudo:stekr"..text)     
local Text = Redis:get(Fast.."Add:Rd:Sudo:Text"..text)   
local photo = Redis:get(Fast.."Add:Rd:Sudo:Photo"..text)
local video = Redis:get(Fast.."Add:Rd:Sudo:Video"..text)
local document = Redis:get(Fast.."Add:Rd:Sudo:File"..text)
local audio = Redis:get(Fast.."Add:Rd:Sudo:Audio"..text)
local video_note = Redis:get(Fast.."Add:Rd:Sudo:video_note"..text)
if Text then 
local UserInfo = bot.getUser(msg.sender_id.user_id)
local NumMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..msg.sender_id.user_id) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..msg.sender_id.user_id) or 0
local Text = Text:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Text = Text:gsub('#name',FlterBio(UserInfo.first_name))
local Text = Text:gsub('#id',msg.sender_id.user_id)
local Text = Text:gsub('#edit',NumMessageEdit)
local Text = Text:gsub('#msgs',NumMsg)
local Text = Text:gsub('#stast',Status_Gps)
if Text:match("]") then
send(msg_chat_id,msg_id,Text,"md",true) 
else
send(msg_chat_id,msg_id,"["..Text.."]","md",true) 
end
end
if video_note then
bot.sendVideoNote(msg_chat_id, msg.id, video_note)
end
if photo then
bot.sendPhoto(msg.chat_id, msg.id, photo,'')
end  
if stekr then 
bot.sendSticker(msg_chat_id, msg.id, stekr)
end
if veico then 
bot.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md')
end
if video then 
bot.sendVideo(msg_chat_id, msg.id, video, '', "md")
end
if anemi then 
bot.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md')
end
if document then
bot.sendDocument(msg_chat_id, msg.id, document, '', 'md')
end  
if audio then
bot.sendAudio(msg_chat_id, msg.id, audio, '', "md") 
end
end
if text and Redis:get(Fast.."Status:Reply"..msg_chat_id) then
local anemi = Redis:get(Fast.."Add:Rd:Manager:Gif"..text..msg_chat_id)   
local veico = Redis:get(Fast.."Add:Rd:Manager:Vico"..text..msg_chat_id)   
local stekr = Redis:get(Fast.."Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
local Texingt = Redis:get(Fast.."Add:Rd:Manager:Text"..text..msg_chat_id)   
local photo = Redis:get(Fast.."Add:Rd:Manager:Photo"..text..msg_chat_id)
local video = Redis:get(Fast.."Add:Rd:Manager:Video"..text..msg_chat_id)
local document = Redis:get(Fast.."Add:Rd:Manager:File"..text..msg_chat_id)
local audio = Redis:get(Fast.."Add:Rd:Manager:Audio"..text..msg_chat_id)
local video_note = Redis:get(Fast.."Add:Rd:Manager:video_note"..text..msg_chat_id)
if Texingt then 
local UserInfo = bot.getUser(msg.sender_id.user_id)
local NumMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..msg.sender_id.user_id) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..msg.sender_id.user_id) or 0
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',FlterBio(UserInfo.first_name))
local Texingt = Texingt:gsub('#id',msg.sender_id.user_id)
local Texingt = Texingt:gsub('#edit',NumMessageEdit)
local Texingt = Texingt:gsub('#msgs',NumMsg)
local Texingt = Texingt:gsub('#stast',Status_Gps)
if Texingt:match("]") then
send(msg_chat_id,msg_id,Texingt,"md",true)  
else
send(msg_chat_id,msg_id,"["..Texingt.."]","md",true)  
end
end
if video_note then
bot.sendVideoNote(msg_chat_id, msg.id, video_note)
end
if photo then
local captionsend = Redis:get(Fast.."Add:Rd:caption:Photo"..photo..msg_chat_id) or ''
bot.sendPhoto(msg.chat_id, msg.id, photo,'['..captionsend..']',"md")
end  
if stekr then 
bot.sendSticker(msg_chat_id, msg.id, stekr)
end
if veico then 
bot.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md')
end
if video then 
local captionsend = Redis:get(Fast.."Add:Rd:caption:video"..video..msg_chat_id) or ''
bot.sendVideo(msg_chat_id, msg.id, video, '['..captionsend..']', "md")
end
if anemi then 
bot.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md')
end
if document then
local captionsend = Redis:get(Fast.."Add:Rd:caption:document"..document..msg_chat_id) or ''
bot.sendDocument(msg_chat_id, msg.id, document, '['..captionsend..']', 'md')
end  
if audio then
local captionsend = Redis:get(Fast.."Add:Rd:caption:audio"..audio..msg_chat_id) or ''
bot.sendAudio(msg_chat_id, msg.id, audio, '['..captionsend..']',"md")
end
end
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local test = Redis:get(Fast.."Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg_chat_id)
if Redis:get(Fast.."Set:Rd"..msg.sender_id.user_id..":"..msg_chat_id) == "true1" then
Redis:del(Fast.."Set:Rd"..msg.sender_id.user_id..":"..msg_chat_id)
if msg.content.sticker then   
Redis:set(Fast.."Add:Rd:Sudo:stekr"..test, msg.content.sticker.sticker.remote.id)  
end   
if msg.content.voice_note then  
Redis:set(Fast.."Add:Rd:Sudo:vico"..test, msg.content.voice_note.voice.remote.id)  
end   
if msg.content.animation then   
Redis:set(Fast.."Add:Rd:Sudo:Gif"..test, msg.content.animation.animation.remote.id)  
end  
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Fast.."Add:Rd:Sudo:Text"..test, text)  
end  
if msg.content.audio then
Redis:set(Fast.."Add:Rd:Sudo:Audio"..test, msg.content.audio.audio.remote.id)  
end
if msg.content.document then
Redis:set(Fast.."Add:Rd:Sudo:File"..test, msg.content.document.document.remote.id)  
end
if msg.content.video then
Redis:set(Fast.."Add:Rd:Sudo:Video"..test, msg.content.video.video.remote.id)  
end
if msg.content.video_note then
Redis:set(Fast.."Add:Rd:Sudo:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  
end
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Add:Rd:Sudo:Photo"..test, idPhoto)  
end
send(msg_chat_id,msg_id,"↯︙ تم حفظ رد للمطور \n↯︙ ارسل ( ["..test.."] ) لعرض الرد","md",true)  
return false
end  
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Rd"..msg.sender_id.user_id..":"..msg_chat_id) == "true" then
Redis:set(Fast.."Set:Rd"..msg.sender_id.user_id..":"..msg_chat_id, "true1")
Redis:set(Fast.."Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg_chat_id, text)
Redis:sadd(Fast.."List:Rd:Sudo", text)
send(msg_chat_id,msg_id,[[
↯︙ارسل لي الرد سواء كان 
❨ ملف ↯︙ملصق ↯︙متحركه ↯︙صوره
 ↯︙فيديو ↯︙بصمه الفيديو ↯︙بصمه ↯︙صوت ↯︙رساله ❩
↯︙يمكنك اضافة الى النص ↯︙
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)  
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:On"..msg.sender_id.user_id..":"..msg_chat_id) == "true" then
list = {"Add:Rd:Sudo:video_note","Add:Rd:Sudo:Audio","Add:Rd:Sudo:File","Add:Rd:Sudo:Video","Add:Rd:Sudo:Photo","Add:Rd:Sudo:Text","Add:Rd:Sudo:stekr","Add:Rd:Sudo:vico","Add:Rd:Sudo:Gif"}
for k,v in pairs(list) do
Redis:del(Fast..''..v..text)
end
Redis:del(Fast.."Set:On"..msg.sender_id.user_id..":"..msg_chat_id)
Redis:srem(Fast.."List:Rd:Sudo", text)
return send(msg_chat_id,msg_id,"↯︙ تم مسح الرد من الردود العامه","md",true)  
end
end
if Redis:get(Fast.."Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر ↯︙' then   
Redis:del(Fast.."Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, "\n↯︙ تم الغاء الاذاعه للمجموعات","md",true)  
end 
local list = Redis:smembers(Fast.."ChekBotAdd") 
if msg.content.video_note then
for k,v in pairs(list) do 
bot.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
Redis:set(Fast.."PinMsegees:"..v,msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
bot.sendPhoto(v, 0, idPhoto,'')
Redis:set(Fast.."PinMsegees:"..v,idPhoto)
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
bot.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
Redis:set(Fast.."PinMsegees:"..v,msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
bot.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
Redis:set(Fast.."PinMsegees:"..v,msg.content.voice_note.voice.remote.id)
end
elseif msg.content.video then 
for k,v in pairs(list) do 
bot.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
Redis:set(Fast.."PinMsegees:"..v,msg.content.video.video.remote.id)
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
bot.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
Redis:set(Fast.."PinMsegees:"..v,msg.content.animation.animation.remote.id)
end
elseif msg.content.document then
for k,v in pairs(list) do 
bot.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
Redis:set(Fast.."PinMsegees:"..v,msg.content.document.document.remote.id)
end
elseif msg.content.audio then
for k,v in pairs(list) do 
bot.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
Redis:set(Fast.."PinMsegees:"..v,msg.content.audio.audio.remote.id)
end
elseif text then
for k,v in pairs(list) do 
send(v,0,text,"html",true)
Redis:set(Fast.."PinMsegees:"..v,text)
end
end
send(msg_chat_id,msg_id,"↯︙ تمت الاذاعه الى *- "..#list.." * الكروب في البوت ","md",true)      
Redis:del(Fast.."Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(Fast.."Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر ↯︙' then   
Redis:del(Fast.."Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, "\n↯︙ تم الغاء الاذاعه خاص","md",true)  
end 
local list = Redis:smembers(Fast..'Num:User:Pv')  
if msg.content.video_note then
for k,v in pairs(list) do 
bot.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
bot.sendPhoto(v, 0, idPhoto,'')
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
bot.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
bot.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
end
elseif msg.content.video then 
for k,v in pairs(list) do 
bot.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
bot.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
end
elseif msg.content.document then
for k,v in pairs(list) do 
bot.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
end
elseif msg.content.audio then
for k,v in pairs(list) do 
bot.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
end
elseif text then
for k,v in pairs(list) do 
send(v,0,text,"html",true)
end
end
send(msg_chat_id,msg_id,"↯︙ تمت الاذاعه الى *- "..#list.." * مشترك في البوت ","md",true)      
Redis:del(Fast.."Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(Fast.."Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر ↯︙' then   
Redis:del(Fast.."Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, "\n↯︙ تم الغاء الاذاعه للمجموعات","md",true)  
end 
local list = Redis:smembers(Fast.."ChekBotAdd") 
if msg.content.video_note then
for k,v in pairs(list) do 
bot.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
bot.sendPhoto(v, 0, idPhoto,'')
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
bot.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
bot.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
end
elseif msg.content.video then 
for k,v in pairs(list) do 
bot.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
bot.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
end
elseif msg.content.document then
for k,v in pairs(list) do 
bot.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
end
elseif msg.content.audio then
for k,v in pairs(list) do 
bot.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
end
elseif text then
for k,v in pairs(list) do 
send(v,0,text,"html",true)
end
end
send(msg_chat_id,msg_id,"↯︙ تمت الاذاعه الى *- "..#list.." * الكروب في البوت ","md",true)      
Redis:del(Fast.."Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(Fast.."Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر ↯︙' then   
Redis:del(Fast.."Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, "\n↯︙ تم الغاء الاذاعه بالتوجيه للمجموعات","md",true)    
end 
if msg.forward_info then 
local list = Redis:smembers(Fast.."ChekBotAdd")   
send(msg_chat_id,msg_id,"↯︙ تم التوجيه الى *- "..#list.." * الكروب في البوت ","md",true)      
for k,v in pairs(list) do  
bot.forwardMessages(v, msg_chat_id, msg_id,0,0,true,false,false)
end   
Redis:del(Fast.."Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
end 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(Fast.."Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر ↯︙' then   
Redis:del(Fast.."Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, "\n↯︙ تم الغاء الاذاعه بالتوجيه خاص","md",true)    
end 
if msg.forward_info then 
local list = Redis:smembers(Fast.."Num:User:Pv")   
send(msg_chat_id,msg_id,"↯︙ تم التوجيه الى *- "..#list.." * الكروب في البوت ","md",true) 
for k,v in pairs(list) do  
bot.forwardMessages(v, msg_chat_id, msg_id,0,1,msg.media_album_id,false,true)
end   
Redis:del(Fast.."Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
end 
return false
end
if text and Redis:get(Fast..'GetTexting:DevFast'..msg_chat_id..':'..msg.sender_id.user_id) then
if text == 'الغاء' or text == 'الغاء الامر ↯︙' then 
Redis:del(Fast..'GetTexting:DevFast'..msg_chat_id..':'..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,'↯︙ تم الغاء حفظ كليشة المطور')
end
Redis:set(Fast..'Texting:DevFast',text)
Redis:del(Fast..'GetTexting:DevFast'..msg_chat_id..':'..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,'↯︙ تم حفظ كليشة المطور')
end
if Redis:get(Fast.."Redis:Id:Group"..msg.chat_id..""..msg.sender_id.user_id) then 
if text == 'الغاء' then 
send(msg_chat_id,msg_id, "\n↯︙ تم الغاء امر تعيين الايدي","md",true)  
Redis:del(Fast.."Redis:Id:Group"..msg.chat_id..""..msg.sender_id.user_id) 
return false  
end 
Redis:del(Fast.."Redis:Id:Group"..msg.chat_id..""..msg.sender_id.user_id) 
Redis:set(Fast.."Set:Id:Group"..msg.chat_id,text:match("(.*)"))
send(msg_chat_id,msg_id,'↯︙ تم تعيين الايدي الجديد',"md",true)  
end
if Redis:get(Fast.."Redis:Id:Groups"..msg.chat_id..""..msg.sender_id.user_id) then 
if text == 'الغاء' then 
send(msg_chat_id,msg_id, "\n↯︙ تم الغاء امر تعيين الايدي","md",true)  
Redis:del(Fast.."Redis:Id:Groups"..msg.chat_id..""..msg.sender_id.user_id) 
return false  
end 
Redis:del(Fast.."Redis:Id:Groups"..msg.chat_id..""..msg.sender_id.user_id) 
Redis:set(Fast.."Set:Id:Groups",text:match("(.*)"))
send(msg_chat_id,msg_id,'↯︙ تم تعيين الايدي الجديد عام',"md",true)  
end
if Redis:get(Fast.."Change:Name:Bot"..msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر ↯︙' then   
Redis:del(Fast.."Change:Name:Bot"..msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, "\n↯︙ تم الغاء امر تغير اسم البوت","md",true)  
end 
Redis:del(Fast.."Change:Name:Bot"..msg.sender_id.user_id) 
Redis:set(Fast.."Name:Bot",text) 
return send(msg_chat_id,msg_id, "↯︙ تم تغير اسم البوت الى - "..text,"md",true)    
end 
if Redis:get(Fast.."Change:Start:Bot"..msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر ↯︙' then   
Redis:del(Fast.."Change:Start:Bot"..msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, "\n↯︙ تم الغاء امر تغير كليشه start","md",true)  
end 
Redis:del(Fast.."Change:Start:Bot"..msg.sender_id.user_id) 
Redis:set(Fast.."Start:Bot",text) 
return send(msg_chat_id,msg_id, "↯︙ تم تغيير كليشه start - "..text,"md",true)    
end 

-------*****************-------*****************-------*****************

if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:Set:Manager:rd"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
Redis:set(Fast.."gamebot:Set:Manager:rd"..msg.sender_id.user_id..":"..msg.chat_id,"true1uu")
Redis:sadd(Fast.."gamebot:List:Manager", text)
return send(msg.chat_id,msg.id,'\nتم حفظ السؤال بنجاح')
end
end

if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:Set:Manager:rdd"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
Redis:set(Fast.."gamebot:Set:Manager:rdd"..msg.sender_id.user_id..":"..msg.chat_id,"true1uu")
Redis:srem(Fast.."gamebot:List:Manager", text)
return send(msg.chat_id,msg.id,'\nتم مسح السؤال بنجاح')
end
end
if msg.content.audio then  
if Redis:get(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'start' then
Redis:set(Fast.."audio:Games"..msg.sender_id.user_id..":"..msg.chat_id,msg.content.audio.audio.remote.id)  
Redis:sadd(Fast.."audio:Games:Bot",msg.content.audio.audio.remote.id)  
Redis:set(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id,'started')
return send(msg.chat_id, msg.id,'↯︙ ارسل اسم الموسيقى الان ...')
end   
end

if Redis:get(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'started' then
Redis:del(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
local Id_audio = Redis:get(Fast.."audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
Redis:set(Fast..'Text:Games:audio'..Id_audio,text)
Redis:del(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
return send(msg.chat_id, msg.id,'↯︙ تم حفظ الصوت ')
end

if Redis:get(Fast..'Games:Set:Answer'..msg.chat_id) then
if text == ""..(Redis:get(Fast..'Games:Set:Answer'..msg.chat_id) or '66765$47').."" then 
Redis:del(Fast.."Games:Set:Answer"..msg.chat_id)
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id,5)  
Redis:del(Fast.."Games:Set:Answer"..msg.chat_id)
return send(msg.chat_id,msg.id,'*↯︙ الف مبروك اجابتك صحيحه تم اضافه لك 5 نقاط*')
end
end
if Redis:get(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'startdel' then
if not Redis:sismember(Fast.."All:text:Games:Bot",text) then
send(msg_chat_id,msg_id,'↯︙ لا يوجد صوتيه بهذا الاسم في العامه')
Redis:del(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
return false
end
Redis:del(Fast.."All:audio:Games"..text)
Redis:srem(Fast.."All:text:Games:Bot",text)  
Redis:del(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
send(msg_chat_id,msg_id,'↯︙ تم مسح الصوتيه بنجاح')
return false
end

if Redis:get(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'start' then
Redis:set(Fast..'All:Text:Games:audio'..msg.chat_id,text)
Redis:sadd(Fast.."All:text:Games:Bot",text)  
Redis:set(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id,'started')
send(msg_chat_id,msg_id,'↯︙ الان ارسل الصوتيه ليتم حفظها باسم  : '..text)
return false
end
if Redis:get(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'started' then
if msg.content.audio then  
local nameaudio = Redis:get(Fast..'All:Text:Games:audio'..msg.chat_id)
Redis:set(Fast.."All:audio:Games"..nameaudio,msg.content.audio.audio.remote.id)  
Redis:del(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
send(msg_chat_id,msg_id,'↯︙ تم حفظ الصوتيه باسم : '..nameaudio)
return false
end   
end
if text and not Redis:get(Fast..'lock_geamsAudio'..msg.chat_id) then
local nameaudio = Redis:get(Fast.."All:audio:Games"..text)
if nameaudio then
bot.sendAudio(msg_chat_id, msg.id,nameaudio , '', "md") 
end
end

if Redis:get(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'startdel' then
if not Redis:sismember(Fast.."text:Games:Bot"..msg.chat_id,text) then
send(msg_chat_id,msg_id,'↯︙ لا يوجد صوتيه بهذا الاسم في الكروب')
Redis:del(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
return false
end
Redis:del(Fast.."audio:Games"..msg.chat_id..text)
Redis:srem(Fast.."text:Games:Bot"..msg.chat_id,text)  
Redis:del(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
send(msg_chat_id,msg_id,'↯︙ تم مسح الصوتيه بنجاح')
return false
end


if Redis:get(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'started' then
if msg.content.audio then  
local nameaudio = Redis:get(Fast..'Text:Games:audio'..msg.chat_id)
Redis:set(Fast.."audio:Games"..msg.chat_id..nameaudio,msg.content.audio.audio.remote.id)  
Redis:del(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
send(msg_chat_id,msg_id,'↯︙ تم حفظ الصوتيه باسم : '..nameaudio)
return false
end   
end
if text and not Redis:get(Fast..'lock_geamsAudio1'..msg.chat_id) then
local nameaudio = Redis:get(Fast.."audio:Games"..msg.chat_id..text)
if nameaudio then
bot.sendAudio(msg_chat_id, msg.id,nameaudio , '', "md") 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "truedel" then
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"truefguigf1")
Redis:del(Fast.."gamebot:newqus"..msg.chat_id,text)
Redis:srem(Fast.."gamebot:new1", text)
return send(msg_chat_id,msg_id, '\nتم مسح السؤال بنجاح') 
end
end

if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true1")
Redis:set(Fast.."gamebot:newqus"..msg.chat_id,text)
Redis:sadd(Fast.."gamebot:new1", text)
return send(msg_chat_id,msg_id, '\nتم حفظ السؤال بنجاح \n ارسل الجواب الاول') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true1" then
local quschen = Redis:get(Fast.."gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."gamebot:newqus:as1"..quschen,text)
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true2")
return send(msg_chat_id,msg_id, ' \n ارسل الجواب الثاني') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true2" then
local quschen = Redis:get(Fast.."gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."gamebot:newqus:as2"..quschen,text)
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true3")
return send(msg_chat_id,msg_id, '\n ارسل الجواب الثالث') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true3" then
local quschen = Redis:get(Fast.."gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."gamebot:newqus:as3"..quschen,text)
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true4")
return send(msg_chat_id,msg_id, '\n ارسل الجواب الرابع') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true4" then
local quschen = Redis:get(Fast.."gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."gamebot:newqus:as0"..quschen,text)
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true44")
return send(msg_chat_id,msg_id, '\nتم حفظ الاجوبه \n ارسل الجواب الصحيح') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true44" then
local quschen = Redis:get(Fast.."gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."gamebot:newqus:as4"..quschen,text)
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true186")
return send(msg_chat_id,msg_id, '\nتم حفظ الجواب الصحيح') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "truedel" then
send(msg_chat_id,msg_id, '\nتم مسح الغز بنجاح')
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"truefguigf1")
Redis:del(Fast.."lkz:gamebot:newqus"..msg.chat_id,text)
Redis:srem(Fast.."lkz:gamebot:new1", text)
return false 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
send(msg_chat_id,msg_id, '\nتم حفظ اللغز بنجاح \n ارسل الجواب الاول')
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true1")
Redis:set(Fast.."lkz:gamebot:newqus"..msg.chat_id,text)
Redis:sadd(Fast.."lkz:gamebot:new1", text)
return false 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true1" then
send(msg_chat_id,msg_id, ' \n ارسل الجواب الثاني')
local quschen = Redis:get(Fast.."lkz:gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."lkz:gamebot:newqus:as1"..quschen,text)
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true2")
return false 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true2" then
send(msg_chat_id,msg_id, '\n ارسل الجواب الثالث')
local quschen = Redis:get(Fast.."lkz:gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."lkz:gamebot:newqus:as2"..quschen,text)
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true3")
return false 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true3" then
send(msg_chat_id,msg_id, ' \n ارسل الجواب الصحيح')
local quschen = Redis:get(Fast.."lkz:gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."lkz:gamebot:newqus:as3"..quschen,text)
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true44")
return false 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true44" then
send(msg_chat_id,msg_id, '\nتم حفظ الجواب الصحيح')
local quschen = Redis:get(Fast.."lkz:gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."lkz:gamebot:newqus:as4"..quschen,text)
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true186")
return false 
end
end
if Redis:get(Fast..":"..msg.sender_id.user_id..":lov_Bots"..msg.chat_id) == "sendlove" then
num = {"😂 10","🤤 20","😢 30","😔 35","😒 75","🤩 34","😗 66","🤐 82","😪 23","😫 19","😛 55","😜 80","😲 63","😓 32","🙂 27","😎 89","😋 99","😁 98","😀 79","🤣 100","😣 8","🙄 3","😕 6","🤯 0",};
sendnum = num[math.random(#num)]
local tttttt = '↯︙ اليك النتائج  :\n\n↯︙ نسبة الحب بيـن : *'..text..'* '..sendnum..'%'
send(msg_chat_id,msg_id,tttttt) 
Redis:del(Fast..":"..msg.sender_id.user_id..":lov_Bots"..msg.chat_id)
end
if Redis:get(Fast..":"..msg.sender_id.user_id..":lov_Bottts"..msg.chat_id) == "sendlove" then
num = {"😂 10","🤤 20","😢 30","😔 35","😒 75","🤩 34","😗 66","🤐 82","😪 23","😫 19","😛 55","😜 80","😲 63","😓 32","🙂 27","😎 89","😋 99","😁 98","😀 79","🤣 100","😣 8","🙄 3","😕 6","🤯 0",};
sendnum = num[math.random(#num)]
local tttttt = '↯︙ اليك النتائج  :\n\n↯︙ نسبة الغباء  : *'..text..'* '..sendnum..'%'
send(msg_chat_id,msg_id,tttttt) 
Redis:del(Fast..":"..msg.sender_id.user_id..":lov_Bottts"..msg.chat_id)
end
if Redis:get(Fast..":"..msg.sender_id.user_id..":lov_Botttuus"..msg.chat_id) == "sendlove" then
num = {"😂 10","🤤 20","😢 30","😔 35","😒 75","🤩 34","😗 66","🤐 82","😪 23","😫 19","😛 55","😜 80","😲 63","😓 32","🙂 27","😎 89","😋 99","😁 98","😀 79","🤣 100","😣 8","🙄 3","😕 6","🤯 0",};
sendnum = num[math.random(#num)]
local tttttt = '↯︙ اليك النتائج  :\n\n↯︙ نسبة الذكاء  : *'..text..'* '..sendnum..'%'
send(msg_chat_id,msg_id,tttttt) 
Redis:del(Fast..":"..msg.sender_id.user_id..":lov_Botttuus"..msg.chat_id)
end
if text and Redis:get(Fast..":"..msg.sender_id.user_id..":krh_Bots"..msg.chat_id) == "sendkrhe" then
num = {"😂 10","🤤 20","😢 30","😔 35","😒 75","🤩 34","😗 66","🤐 82","😪 23","😫 19","😛 55","😜 80","😲 63","😓 32","🙂 27","😎 89","😋 99","😁 98","😀 79","🤣 100","😣 8","🙄 3","😕 6","🤯 0",};
sendnum = num[math.random(#num)]
local tttttt = '↯︙ اليك النتائج  :\n\n↯︙ نسبه الكرة : *'..text..'* '..sendnum..'%'
send(msg_chat_id,msg_id,tttttt) 
Redis:del(Fast..":"..msg.sender_id.user_id..":krh_Bots"..msg.chat_id)
end
if text and text ~="نسبه الرجوله" and Redis:get(Fast..":"..msg.sender_id.user_id..":rjo_Bots"..msg.chat_id) == "sendrjoe" then
numj = {"😂 10","🤤 20","😢 30","😔 35","😒 75","🤩 34","😗 66","🤐 82","😪 23","😫 19","😛 55","😜 80","😲 63","😓 32","🙂 27","😎 89","😋 99","😁 98","🥰 79","🤣 100","😣 8","🙄 3","😕 6","🤯 0",};
sendnuj = numj[math.random(#numj)]
local tttttt = '↯︙ اليك النتائج  :\n\n↯︙  نسبة الرجوله لـ : *'..text..'* '..sendnuj..'%'
send(msg_chat_id,msg_id,tttttt) 
Redis:del(Fast..":"..msg.sender_id.user_id..":rjo_Bots"..msg.chat_id)
end
if text and text ~="نسبه الانوثه" and Redis:get(Fast..":"..msg.sender_id.user_id..":ano_Bots"..msg.chat_id) == "sendanoe" then
numj = {"😂 10","🤤 20","😢 30","😔 35","😒 75","🤩 34","😗 66","🤐 82","😪 23","😫 19","😛 55","😜 80","😲 63","😓 32","🙂 27","😎 89","😋 99","?? 98","😀 79","🤣 100","😣 8","🙄 3","😕 6","🤯 0",};
sendnuj = numj[math.random(#numj)]
local tttttt = '↯︙ اليك النتائج  :\n\n↯︙  نسبه الانوثة لـ : *'..text..'* '..sendnuj..'%'
send(msg_chat_id,msg_id,tttttt) 
Redis:del(Fast..":"..msg.sender_id.user_id..":ano_Bots"..msg.chat_id)
end
if text == "كشف الكدب" or text == "كشف الكذب" and msg.reply_to_message_id == 0  then
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
Redis:set(Fast.."kahzm"..msg.sender_id.user_id,"sendnumh") 
Text = '↯︙ارسل لي الجمله الان لمعرفتها كذب ام صح ! '
return bot.sendText(msg_chat_id,msg_id,Text,"md",true) 
end
end
if text and Redis:get(Fast.."kahzm"..msg.sender_id.user_id) == "sendnumh" then
num = {"انت هم مقتنع بهاذ كلامك بشرفك؟","تعرف هاني رمزي مو ؟","ايبا والله غبي انت ومصدك","اي حبي ربالصح بعد شتريد","هسه انته بس تلح حته عود اكلك صح مو ؟","صحيح وابصملك بلعشرا","سامع ب ابو فخري مو ؟ ",};
sendnum = num[math.random(#num)]
sl = ' ⟨  '..text..'  ⟩ \n '..sendnum..' '
 bot.sendText(msg_chat_id,msg_id,sl,"md",true) 
Redis:del(Fast.."kahzm"..msg.sender_id.user_id)
return false
end

if text then
local NewCmmd = Redis:get(Fast.."All:Get:Reides:Commands:Group"..text) or Redis:get(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if NewCmmd then
text = (NewCmmd or text)
end
end
if Redis:get(Fast.."Channel:Redis"..msg.sender_id.user_id) == "on" then
Redis:set(Fast.."Channel:Redis"..msg.sender_id.user_id,"off")
local m = https.request("http://api.telegram.org/bot"..Token.."/getchat?chat_id="..text)
data = json:decode(m)
if data.result.invite_link then
local ch = data.result.id
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '1', data = msg.sender_id.user_id..'/setallmember'}, {text = '2', data = msg.sender_id.user_id..'/setforcmd'}, 
},
}
}
send(msg_chat_id,msg_id,'❍ تم حفظ القناه \n❍ اختار كيف تريد تفعيله \n❍ 1 : وضع الاشتراك الاجباري لكل الاعضاء \n❍ 2 : وضع الاشتراك الاجباري عند استخدام الاوامر فقط \n',"md",false, false, false, false, reply_markup)
Redis:del(Fast.."Chat:Channel:Join")
Redis:set(Fast.."Chat:Channel:Join",ch)
Redis:del(Fast.."Channel:Join")
Redis:set(Fast.."Channel:Join",data.result.invite_link)
else
send(msg_chat_id,msg_id,'❍ المعرف خطأ او البوت ليس مشرف في القناه ',"md",true)  
end
end
if Redis:get(Fast.."Channel:Redis"..msg.sender_id.user_id) == "on" then
Redis:set(Fast.."Channel:Redis"..msg.sender_id.user_id,"off")
local m = https.request("http://api.telegram.org/bot"..Token.."/getchat?chat_id="..text)
data = json:decode(m)
if data.result.invite_link then
local ch = data.result.id
send(msg_chat_id,msg_id,'❍ تم حفظ القناه ',"md",true)  
Redis:del(Fast.."Chat:Channel:Join")
Redis:set(Fast.."Chat:Channel:Join",ch)
Redis:del(Fast.."Channel:Join")
Redis:set(Fast.."Channel:Join",data.result.invite_link)
else
send(msg_chat_id,msg_id,'❍ المعرف خطأ او البوت ليس مشرف في القناه ',"md",true)  
end
end
if text == 'تفعيل الاشتراك الاجباري' or text == 'تفعيل الاشتراك الاجباري ↯︙' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:set(Fast..'Channel:Redis'..msg_chat_id..':'..senderr,true)
return send(msg_chat_id,msg_id,"\n↯︙ ارسل الي الان قناة الاشتراك ","md",true)  
end
if text == 'تعطيل الاشتراك الاجباري' or text == 'تعطيل الاشتراك الاجباري ↯︙' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:del(Fast..'Channel:Join')
return send(msg_chat_id,msg_id,"\n↯︙ تم تعطيل الاشتراك الاجباري","md",true)  
end



if text == 'الكروبات البوت' or text == 'الكروبات البوت' or text == 'لينك الكروبات' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*↯︙ انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local G = "الكروبات البوت ↯︙ \n"
local list = Redis:smembers(Fast..'ChekBotAdd')  
for k,v in pairs(list) do  
local Info_Chats = bot.getSupergroupFullInfo(v)
local Get_Chat = bot.getChat(v)
if Info_Chats and Info_Chats.invite_link then
link = Info_Chats.invite_link.invite_link
else
link = "لا يوجد" 
end
if Get_Chat and Get_Chat.title then
title = Get_Chat.title
else 
title = "لا يوجد" 
end
G = G.." اسم الكروب ⇿ "..title.."\n ايدي الكروب ⇿ "..v.."\n رابط الكروب ⇿ "..link.."\n\n"
end
bot.sendText(msg_chat_id,msg_id,G, 'html')
end
if text == 'رفع المطورين' and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local FilesJson = JSON.decode(Get_Info)
i = 0
if FilesJson and FilesJson.dev then
for k,v in pairs(FilesJson.dev) do
i = i + 1
Redis:sadd(Fast.."Dev:Groups",v)  
end
x = 0
for k,v in pairs(FilesJson.devss) do
x = x + 1
Redis:sadd(Fast.."Devss:Groups",v)  
end
send(msg.chat_id,msg.id,"↯︙ تم رفع "..i.." من المطورين و "..x.." من المطورين الثانويين")
else
send(msg.chat_id,msg.id,"↯︙ الملف غير صالح")
end
end
end
if text == 'رفع النسخه الاحتياطيه' and msg.reply_to_message_id ~= 0 or text == 'رفع نسخه احتياطيه' and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name

local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
var(File)
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local FilesJson = JSON.decode(Get_Info)
if tonumber(Fast) ~= tonumber(FilesJson.BotId) then
return send(msg_chat_id,msg_id,'↯︙ عذرا هذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه')
end -- end botid
send(msg_chat_id,msg_id,'↯︙ جاري استرجاع المشتركين والكروبات ...')
Y = 0
for k,v in pairs(FilesJson.UsersBot) do
Y = Y + 1
Redis:sadd(Fast..'Num:User:Pv',v)  
end
X = 0
for GroupId,ListGroup in pairs(FilesJson.GroupsBot) do
X = X + 1
Redis:sadd(Fast.."ChekBotAdd",GroupId) 
if ListGroup.President then
for k,v in pairs(ListGroup.President) do
Redis:sadd(Fast.."SuperCreator:Group"..GroupId,v)
end
end
if ListGroup.Constructor then
for k,v in pairs(ListGroup.Constructor) do
Redis:sadd(Fast.."Creator:Group"..GroupId,v)
end
end
if ListGroup.Manager then
for k,v in pairs(ListGroup.Manager) do
Redis:sadd(Fast.."Manger:Group"..GroupId,v)
end
end
if ListGroup.Admin then
for k,v in pairs(ListGroup.Admin) do
Redis:sadd(Fast.."Admin:Group"..GroupId,v)
end
end
if ListGroup.Vips then
for k,v in pairs(ListGroup.Vips) do
Redis:sadd(Fast.."Special:Group"..GroupId,v)
end
end 
end
return send(msg_chat_id,msg_id,'↯︙ تم استرجاع {'..X..'} الكروب \n↯︙ واسترجاع {'..Y..'} مشترك في البوت')
end
end
if text == 'رفع نسخه تشاك' and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
if tonumber(Name_File:match('(%d+)')) ~= tonumber(Fast) then 
return send(msg_chat_id,msg_id,'↯︙ عذرا هذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه')
end -- end Namefile
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local All_Groups = JSON.decode(Get_Info)
if All_Groups.GP_BOT then
for idg,v in pairs(All_Groups.GP_BOT) do
Redis:sadd(Fast.."ChekBotAdd",idg) 
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
Redis:sadd(Fast.."Creator:Group"..idg,idmsh)
end;end
if v.MDER then
for k,idmder in pairs(v.MDER) do
Redis:sadd(Fast.."Manger:Group"..idg,idmder)  
end;end
if v.MOD then
for k,idmod in pairs(v.MOD) do
Redis:sadd(Fast.."Admin:Group"..idg,idmod)
end;end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
Redis:sadd(Fast.."SuperCreator:Group"..idg,idASAS)
end;end
end
return send(msg_chat_id,msg_id,'↯︙ تم استرجاع المجموعات من نسخه تشاكي')
else
return send(msg_chat_id,msg_id,'↯︙ الملف لا يدعم هذا البوت')
end
end
end

if (Redis:get(Fast.."AddSudosNew"..msg_chat_id) == 'true') then
if text == "الغاء" or text == 'الغاء الامر ↯︙' then   
Redis:del(Fast.."AddSudosNew"..msg_chat_id)
return send(msg_chat_id,msg_id, "\n↯︙ تم الغاء امر تغيير المطور الاساسي","md",true)    
end 
Redis:del(Fast.."AddSudosNew"..msg_chat_id)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = bot.searchPublicChat(text)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف قناة او الكروب ","md",true)  
end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Token..[[",
UserBot = "]]..UserBot..[[",
UserSudo = "]]..text:gsub('@','')..[[",
SudoId = ]]..UserId_Info.id..[[
}
]])
Informationlua:close()
send(msg_chat_id,msg_id,"\n↯︙ تم تغيير المطور الاساسي اصبح على : [@"..text:gsub('@','').."]","md",true)  
dofile('Fast.lua')  
return false
end
end

if text == 'تغيير المطور الاساسي' or text == '↯︙ تغيير المطور الاساسي' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:set(Fast.."AddSudosNew"..msg_chat_id,true)
return send(msg_chat_id,msg_id,"↯︙ ارسل معرف المطور الاساسي مع @","md",true)
end
if text == 'تحديث السورس' or text == 'تحديث السورس ↯︙' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
os.execute('rm -rf Fast.lua')
download('http://45.32.238.150/Mero/Fast.lua','Fast.lua')
return send(msg_chat_id,msg_id,'\n*↯︙ تم تحديث السورس * ',"md",true)  
end

if text and text:match("^تعيين عدد الاعضاء (%d+)$") then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'Num:Add:Bot',text:match("تعيين عدد الاعضاء (%d+)$") ) 
send(msg_chat_id,msg_id,'*↯︙ تم تعيين عدد اعضاء تفعيل البوت اكثر من : '..text:match("تعيين عدد الاعضاء (%d+)$")..' عضو *',"md",true)  
elseif text =='الاحصائيات' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id,'*↯︙ عدد احصائيات البوت الكامله \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n↯︙ عدد المجموعات : '..(Redis:scard(Fast..'ChekBotAdd') or 0)..'\n↯︙ عدد المشتركين : '..(Redis:scard(Fast..'Num:User:Pv') or 0)..'*',"md",true)  
end
if text == 'تفعيل' and msg.Dev then
if Redis:sismember(Fast..'ban:online',msg.chat_id) then
send(msg_chat_id,msg_id,"\n*↯︙ عذرا هذا الكروب محظور من قبل المطور الاساسي سوف اغادر*","md",true)  
sleep(2)
bot.leaveChat(msg.chat_id)
return false 
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*↯︙ عذرآ البوت ليس ادمن في الكروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
Redis:sadd(Fast.."ChekBotAdd",msg_chat_id)
Redis:set(Fast..'lock_chengname'..msg.chat_id,true)  
Redis:set(Fast.."Status:Games"..msg.chat_id,true) 
Redis:set(Fast.."smsme"..msg.chat_id,true)
Redis:set(Fast.."Status:IdPhoto"..msg.chat_id,true) 
Redis:set(Fast.."Status:Id"..msg.chat_id,true) 
Redis:set(Fast.."Status:ReplySudo"..msg.chat_id,true) 
Redis:set(Fast.."Status:Reply"..msg.chat_id,true) 
Redis:set(Fast.."Status:IdPhoto"..msg.chat_id,true) 
Redis:set(Fast.."Status:Id"..msg.chat_id,true) 
Redis:set(Fast.."Status:Welcome"..msg.chat_id,true) 
Redis:set(Fast.."Status:Link"..msg.chat_id,true) 
Redis:set(Fast.."Status:Games"..msg.chat_id,true) 
Redis:set(Fast..'tagallgroup'..msg.chat_id,'open') 
Redis:set(Fast..'tagall@all'..msg.chat_id,'open') 
Redis:del(Fast.."knele"..msg.chat_id)
Redis:set(Fast.."Status:Link"..msg.chat_id,true) 
Redis:set(Fast.."Status:Welcome"..msg.chat_id,true) 
Redis:set(Fast.."Status:BanId"..msg.chat_id,true) 
Redis:set(Fast.."Status:ReplySudo"..msg.chat_id,true) 
Redis:set(Fast.."Status:Reply"..msg.chat_id,true) 
Redis:set(Fast.."Status:IdPhoto"..msg.chat_id,true) 
Redis:set(Fast.."Status:Id"..msg.chat_id,true) 
Redis:set(Fast.."Status:SetId"..msg.chat_id,true) 
Redis:set(Fast.."Status:KickMe"..msg.chat_id,true) 
Redis:set(Fast.."replayallbot"..msg.chat_id,true)
Redis:del(Fast.."amrthshesh"..msg.chat_id)
Redis:del(Fast.."spammkick"..msg.chat_id)
Redis:del(Fast.."intg"..msg.chat_id)
Redis:del(Fast.."kadmeat"..msg.chat_id)
Redis:del(Fast.."zhrfa"..msg.chat_id)
Redis:del(Fast.."brjj"..msg.chat_id)
Redis:del(Fast.."idnotmembio"..msg.chat_id)
Redis:del(Fast.."idnotmem"..msg.chat_id)
Redis:del(Fast..'lock_geamsAudio1'..msg.chat_id) 
Redis:del(Fast..'lock_geamsAudio'..msg.chat_id) 
Redis:del(Fast.."Lock:tagservrbot"..msg.chat_id)   
list11 ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list11) do 
Redis:del(Fast..''..lock..msg.chat_id)    
end
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
if Redis:sismember(Fast.."ChekBotAdd",msg_chat_id) then
if tonumber(Info_Chats.member_count) < tonumber((Redis:get(Fast..'Num:Add:Bot') or 0)) and not msg.Asasy then
return send(msg_chat_id,msg_id,'↯︙عدد الاعضاء قليل لا يمكن تفعيل الكروب  يجب ان يكوم اكثر من :'..Redis:get(Fast..'Num:Add:Bot'),"md",true)  
end
return send(msg_chat_id,msg_id,'\n*↯︙الكروب : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n↯︙ تم تفعيلها مسبقا *',"md",true)  
else
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- رفع المالك والادمنيه', data = senderr..'/addAdmins@'..msg_chat_id},
},
{
{text = '- قفل جميع الاوامر ', data =senderr..'/LockAllGroup@'..msg_chat_id},{text = '- ترتيب الاوامر', data = senderr..'/trtep@'..msg_chat_id},
},
}
}
if not msg.Asasy then
local UserInfo = bot.getUser(msg.sender_id.user_id)
UserInfo.first_name = Name_User
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- مغادرة الكروب ', data = '/leftgroup@'..msg_chat_id}, 
},
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
send(Sudo_Id,0,'*\n↯︙ تم تفعيل الكروب جديده \n↯︙من قام بتفعيلها : {*['..UserInfo.first_name..'](tg://user?id='..msg.sender_id.user_id..')*} \n↯︙معلومات الكروب :\n↯︙عدد الاعضاء : '..Info_Chats.member_count..'\n↯︙عدد الادمنيه : '..Info_Chats.administrator_count..'\n↯︙عدد المطرودين : '..Info_Chats.banned_count..'\n↯︙ عدد المقيدين : '..Info_Chats.restricted_count..'*',"md",true, false, false, false, reply_markup)
end
Redis:sadd(Fast.."ChekBotAdd",msg_chat_id)
Redis:set(Fast.."Status:Id"..msg_chat_id,true) ;Redis:del(Fast.."Status:Reply"..msg_chat_id) ;Redis:del(Fast.."Status:ReplySudo"..msg_chat_id) ;Redis:set(Fast.."Status:BanId"..msg_chat_id,true) ;Redis:set(Fast.."Status:SetId"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,'\n*↯︙الكروب : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n↯︙ تم تفعيل الكروب *','md', true, false, false, false, reply_markup)
end
end 
if text == 'تفعيل' and not msg.Dev then
if Redis:sismember(Fast..'ban:online',msg.chat_id) then
send(msg_chat_id,msg_id,"\n*↯︙ عذرا هذا الكروب محظور من قبل المطور الاساسي سوف اغادر*","md",true)  
sleep(2)
bot.leaveChat(msg.chat_id)
return false 
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*↯︙ عذرآ البوت ليس ادمن في الكروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end

local StatusMember = bot.getChatMember(msg_chat_id,msg.sender_id.user_id).status.bot
if (StatusMember == "chatMemberStatusCreator") then
local AddedBot = true
elseif (StatusMember == "chatMemberStatusAdministrator") then
local AddedBot = true
else
local AddedBot = false
end
if AddedBot == false then
return send(msg_chat_id,msg_id,"\n*↯︙ عذرا انته لست ادمن او مالك الكروب *","md",true)  
end
if not Redis:get(Fast.."BotFree") then
return send(msg_chat_id,msg_id,"\n*↯︙الوضع الخدمي تم تعطيله من قبل مطور البوت *","md",true)  
end
Redis:sadd(Fast.."ChekBotAdd",msg_chat_id)
Redis:set(Fast..'lock_chengname'..msg.chat_id,true)  
Redis:set(Fast.."Status:Games"..msg.chat_id,true) 
Redis:set(Fast.."smsme"..msg.chat_id,true)
Redis:set(Fast.."Status:IdPhoto"..msg.chat_id,true) 
Redis:set(Fast.."Status:Id"..msg.chat_id,true) 
Redis:set(Fast.."Status:ReplySudo"..msg.chat_id,true) 
Redis:set(Fast.."Status:Reply"..msg.chat_id,true) 
Redis:set(Fast.."Status:IdPhoto"..msg.chat_id,true) 
Redis:set(Fast.."Status:Id"..msg.chat_id,true) 
Redis:set(Fast.."Status:Welcome"..msg.chat_id,true) 
Redis:set(Fast.."Status:Link"..msg.chat_id,true) 
Redis:set(Fast.."Status:Games"..msg.chat_id,true) 
Redis:set(Fast..'tagallgroup'..msg.chat_id,'open') 
Redis:set(Fast..'tagall@all'..msg.chat_id,'open') 
Redis:del(Fast.."knele"..msg.chat_id)
Redis:set(Fast.."Status:Link"..msg.chat_id,true) 
Redis:set(Fast.."Status:Welcome"..msg.chat_id,true) 
Redis:set(Fast.."Status:BanId"..msg.chat_id,true) 
Redis:set(Fast.."Status:ReplySudo"..msg.chat_id,true) 
Redis:set(Fast.."Status:Reply"..msg.chat_id,true) 
Redis:set(Fast.."Status:IdPhoto"..msg.chat_id,true) 
Redis:set(Fast.."Status:Id"..msg.chat_id,true) 
Redis:set(Fast.."Status:SetId"..msg.chat_id,true) 
Redis:set(Fast.."Status:KickMe"..msg.chat_id,true) 
Redis:set(Fast.."replayallbot"..msg.chat_id,true)
Redis:del(Fast.."amrthshesh"..msg.chat_id)
Redis:del(Fast.."spammkick"..msg.chat_id)
Redis:del(Fast.."intg"..msg.chat_id)
Redis:del(Fast.."kadmeat"..msg.chat_id)
Redis:del(Fast.."zhrfa"..msg.chat_id)
Redis:del(Fast.."brjj"..msg.chat_id)
Redis:del(Fast.."idnotmembio"..msg.chat_id)
Redis:del(Fast.."idnotmem"..msg.chat_id)
Redis:del(Fast..'lock_geamsAudio1'..msg.chat_id) 
Redis:del(Fast..'lock_geamsAudio'..msg.chat_id) 
Redis:del(Fast.."Lock:tagservrbot"..msg.chat_id)   
list11 ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list11) do 
Redis:del(Fast..''..lock..msg.chat_id)    
end
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
if Redis:sismember(Fast.."ChekBotAdd",msg_chat_id) then
if tonumber(Info_Chats.member_count) < tonumber((Redis:get(Fast..'Num:Add:Bot') or 0)) and not msg.Asasy then
return send(msg_chat_id,msg_id,'↯︙عدد الاعضاء قليل لا يمكن تفعيل الكروب  يجب ان يكوم اكثر من :'..Redis:get(Fast..'Num:Add:Bot'),"md",true)  
end
return send(msg_chat_id,msg_id,'\n*↯︙الكروب : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n↯︙ تم تفعيلها مسبقا *',"md",true)  
else
if not msg.Asasy then
local UserInfo = bot.getUser(msg.sender_id.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- مغادرة الكروب ', data = '/leftgroup@'..msg_chat_id}, 
},
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
send(Sudo_Id,0,'*\n↯︙ تم تفعيل الكروب جديده \n↯︙من قام بتفعيلها : {*['..UserInfo.first_name..'](tg://user?id='..msg.sender_id.user_id..')*} \n↯︙معلومات الكروب :\n↯︙عدد الاعضاء : '..Info_Chats.member_count..'\n↯︙عدد الادمنيه : '..Info_Chats.administrator_count..'\n↯︙عدد المطرودين : '..Info_Chats.banned_count..'\n↯︙ عدد المقيدين : '..Info_Chats.restricted_count..'*',"md",true, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- رفع المالك والادمنيه', data = senderr..'/addAdmins@'..msg_chat_id},
},
{
{text = '- قفل جميع الاوامر ', data =senderr..'/LockAllGroup@'..msg_chat_id},{text = '- ترتيب الاوامر', data = senderr..'/trtep@'..msg_chat_id},
},
}
}
Redis:sadd(Fast.."ChekBotAdd",msg_chat_id)
Redis:set(Fast.."Status:Id"..msg_chat_id,true) ;Redis:del(Fast.."Status:Reply"..msg_chat_id) ;Redis:del(Fast.."Status:ReplySudo"..msg_chat_id) ;Redis:set(Fast.."Status:BanId"..msg_chat_id,true) ;Redis:set(Fast.."Status:SetId"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,'\n*↯︙الكروب : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n↯︙ تم تفعيل الكروب *','md', true, false, false, false, reply_markup)
end
end

if text == 'تعطيل' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
if not Redis:sismember(Fast.."ChekBotAdd",msg_chat_id) then
return send(msg_chat_id,msg_id,'\n*↯︙الكروب : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n↯︙ تم تعطيلها مسبقا *',"md",true)  
else
if not msg.Asasy then
local UserInfo = bot.getUser(msg.sender_id.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
send(Sudo_Id,0,'*\n↯︙ تم تعطيل الكروب جديده \n↯︙من قام بتعطيلها : {*['..UserInfo.first_name..'](tg://user?id='..msg.sender_id.user_id..')*} \n↯︙معلومات الكروب :\n↯︙عدد الاعضاء : '..Info_Chats.member_count..'\n↯︙عدد الادمنيه : '..Info_Chats.administrator_count..'\n↯︙عدد المطرودين : '..Info_Chats.banned_count..'\n↯︙ عدد المقيدين : '..Info_Chats.restricted_count..'*',"md",true, false, false, false, reply_markup)
end
Redis:srem(Fast.."ChekBotAdd",msg_chat_id)
return send(msg_chat_id,msg_id,'\n*↯︙الكروب : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n↯︙ تم تعطيلها بنجاح *','md',true)
end
end
if chat_type(msg.chat_id) == "GroupBot" and not Redis:sismember(Fast.."ChekBotAdd",msg_chat_id) then
Redis:sadd(Fast.."ChekBotAdd",msg_chat_id)
Redis:set(Fast..'lock_chengname'..msg.chat_id,true)  
Redis:set(Fast.."Status:Games"..msg.chat_id,true) 
Redis:set(Fast.."smsme"..msg.chat_id,true)
Redis:set(Fast.."Status:IdPhoto"..msg.chat_id,true) 
Redis:set(Fast.."Status:Id"..msg.chat_id,true) 
Redis:set(Fast.."Status:ReplySudo"..msg.chat_id,true) 
Redis:set(Fast.."Status:Reply"..msg.chat_id,true) 
Redis:set(Fast.."Status:IdPhoto"..msg.chat_id,true) 
Redis:set(Fast.."Status:Id"..msg.chat_id,true) 
Redis:set(Fast.."Status:Welcome"..msg.chat_id,true) 
Redis:set(Fast.."Status:Link"..msg.chat_id,true) 
Redis:set(Fast.."Status:Games"..msg.chat_id,true) 
Redis:set(Fast..'tagallgroup'..msg.chat_id,'open') 
Redis:set(Fast..'tagall@all'..msg.chat_id,'open') 
Redis:del(Fast.."knele"..msg.chat_id)
Redis:set(Fast.."Status:Link"..msg.chat_id,true) 
Redis:set(Fast.."Status:Welcome"..msg.chat_id,true) 
Redis:set(Fast.."Status:BanId"..msg.chat_id,true) 
Redis:set(Fast.."Status:ReplySudo"..msg.chat_id,true) 
Redis:set(Fast.."Status:Reply"..msg.chat_id,true) 
Redis:set(Fast.."Status:IdPhoto"..msg.chat_id,true) 
Redis:set(Fast.."Status:Id"..msg.chat_id,true) 
Redis:set(Fast.."Status:SetId"..msg.chat_id,true) 
Redis:set(Fast.."Status:KickMe"..msg.chat_id,true) 
Redis:set(Fast.."replayallbot"..msg.chat_id,true)
Redis:del(Fast.."amrthshesh"..msg.chat_id)
Redis:del(Fast.."spammkick"..msg.chat_id)
Redis:del(Fast.."intg"..msg.chat_id)
Redis:del(Fast.."kadmeat"..msg.chat_id)
Redis:del(Fast.."zhrfa"..msg.chat_id)
Redis:del(Fast.."brjj"..msg.chat_id)
Redis:del(Fast.."idnotmembio"..msg.chat_id)
Redis:del(Fast.."idnotmem"..msg.chat_id)
Redis:del(Fast..'lock_geamsAudio1'..msg.chat_id) 
Redis:del(Fast..'lock_geamsAudio'..msg.chat_id) 
Redis:del(Fast.."Lock:tagservrbot"..msg.chat_id)   
list11 ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list11) do 
Redis:del(Fast..''..lock..msg.chat_id)    
end
local list = Redis:smembers(Fast.."ChekBotAdd")
send(Sudo_Id,0,"*↯︙ تم تفعيل الكروب تلقائيا عن طريق البوت*\n↯︙ اصبح عدد الكروباتك *"..#list.."* مجموعه","md",true)
end
if chat_type(msg.chat_id) == "GroupBot" and Redis:sismember(Fast.."ChekBotAdd",msg_chat_id) then

if text then
local GetMsg = Redis:incr(Fast..'Num:Message:User'..msg.chat_id..':'..senderr) 
Redis:hset(Fast..':GroupUserCountMsg:'..msg.chat_id,senderr,GetMsg)
local UserInfo = bot.getUser(senderr) 
if FlterBio(UserInfo.first_name) then
NameLUser = FlterBio(UserInfo.first_name)
else
NameLUser = FlterBio(UserInfo.first_name)
end
NameLUser = NameLUser
NameLUser = NameLUser:gsub("]","")
NameLUser = NameLUser:gsub("[[]","")
Redis:hset(Fast..':GroupNameUser:'..msg.chat_id,senderr,NameLUser)
end

if text and text:match('^ذيع (-100%d+)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local Chatid = text:match('^ذيع (-100%d+)$') 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end 
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local Get_Chat = bot.getChat(Chatid)
if not data.id then
send(msg_chat_id,msg_id,'- لا توجد الكروب في البوت بهذا الايدي')
return false
end
send(Chatid,0,Message_Reply.content.text.text)
send(msg_chat_id,msg_id,'- تم الاذاعه الى  : '..Get_Chat.title..'\n ')
end 



if text and text:match('^حظر الكروب (-100%d+)$') then
local Chatid = text:match('^حظر الكروب (-100%d+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local Get_Chat = bot.getChat(Chatid)
if not data.id then
send(msg_chat_id,msg_id,'- لا توجد الكروب في البوت بهذا الايدي')
return false
end
bot.leaveChat(Chatid)
Redis:sadd(Fast.."Black:listBan:",Chatid)
send(msg_chat_id,msg_id,'- تم حظر الكروب  : ['..Get_Chat.title..']\n - وتم مغادره البوت من الكروب')
end 
if text and text:match('^الغاء حظر الكروب (-100%d+)$') then
local Chatid = text:match('^الغاء حظر الكروب (-100%d+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:srem(Fast.."Black:listBan:",Chatid)
send(msg_chat_id,msg_id,'- تم الغاء حظر الكروب ')
end 

if text == 'السيرفر' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
send(msg_chat_id,msg_id, io.popen([[
linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo '↯︙ ↯︙⊱ { نظام التشغيل } ⊰↯︙ \n*»» '"$linux_version"'*' 
echo '*------------------------------\n*↯︙ ↯︙⊱ { الذاكره العشوائيه } ⊰↯︙ \n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*↯︙ ↯︙⊱ { وحـده الـتـخـزيـن } ⊰↯︙ \n*»» '"$HardDisk"'*'
echo '*------------------------------\n*↯︙ ↯︙⊱ { الـمــعــالــج } ⊰↯︙ \n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*↯︙ ↯︙⊱ { الــدخــول } ⊰↯︙ \n*»» '`whoami`'*'
echo '*------------------------------\n*↯︙ ↯︙⊱ { مـده تـشغيـل الـسـيـرفـر } ⊰↯︙ \n*»» '"$uptime"'*'
]]):read('*all'),"md")
end


if msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then      
Redis:sadd(Fast.."allM"..msg.chat_id, msg.id)
if Redis:get(Fast.."Status:Del:Media"..msg.chat_id) then    
local Numbardel = Redis:get(Fast.."allM:numdel"..msg.chat_id) or 200
local gmedia = Redis:scard(Fast.."allM"..msg.chat_id)  
if tonumber(gmedia) >= tonumber(Numbardel) then
local liste = Redis:smembers(Fast.."allM"..msg.chat_id)
for k,v in pairs(liste) do
local Mesge = v
if Mesge then
t = "↯︙ تم مسح "..k.." من الوسائط تلقائيا\n↯︙ يمكنك تعطيل الميزه باستخدام الامر ( `تعطيل المسح التلقائي` )"
bot.deleteMessages(msg.chat_id,{[1]= Mesge})
end
end
send(msg_chat_id,msg_id, t)
Redis:del(Fast.."allM"..msg.chat_id)
end
end
end
if text and text:match("^ضع عدد المسح (%d+)$") then  
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
local Numbardel = text:match("^ضع عدد المسح (%d+)$")
Redis:set(Fast.."allM:numdel"..msg.chat_id,Numbardel) 
send(msg_chat_id,msg_id, 'تم تعيين العدد  الى : '..Numbardel)
end
if text == "امسح" or text == "مسح الميديا" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."allM"..msg.chat_id)
for k,v in pairs(list) do
local Message = v
if Message then
t = "↯︙ تم مسح "..k.." من الوسائط الموجوده"
bot.deleteMessages(msg.chat_id,{[1]= Message})
Redis:del(Fast.."allM"..msg.chat_id)
end
end
if #list == 0 then
t = "↯︙ لا يوجد ميديا في الكروب"
end
 send(msg_chat_id,msg_id, t)
end
if text == ("الميديا") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local gmria = Redis:scard(Fast.."allM"..msg.chat_id)  
 send(msg_chat_id,msg_id,"↯︙ عدد الميديا الموجود هو (* "..gmria.." *)","md")
end


if text == 'المطور' or text == 'مطور البوت' or text == 'مطور' then   
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local bains = bot.getUser(msg.sender_id.user_id)
if bains.first_name then
klajq = '*['..bains.first_name..'](tg://user?id='..bains.id..')*'
else
klajq = 'لا يوجد'
end
if bains.username then
basgk = ' '..bains.username..' '
else
basgk = 'لا يوجد'
end
local czczh = '*'..bains.first_name..'*'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = czczh, url = "https://t.me/"..bains.username..""},
},
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
bot.sendText(Sudo_Id,0,'*\n●  مرحباً عزيزي المطور \nشخص ما يحتاج الي مساعده\n \n●  اسمه :- '..klajq..' \n●  ايديه :-  : '..msg.sender_id.user_id..'\n●  - معرفة '..basgk..' \n*',"md",false, false, false, false, reply_markup)
end

if text == "صورتي" then
if Redis:get(Fast.."myphoto"..msg.chat_id) then
send(msg_chat_id,msg_id,'*↯︙ الصوره معطله*',"md",true) 
else
local photo = bot.getUserProfilePhotos(senderr)
if photo.total_count > 0 then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'صورتك التاليه', callback_data=senderr.."/sorty2"},
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&reply_to_message_id="..rep.."&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption="..URL.escape("٭ عدد صورك هو "..photo.total_count.." صوره").."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return send(msg_chat_id,msg_id,'*↯︙ لا توجد صوره ف حسابك*',"md",true) 
end
end
end

if text == "قفل تعديل الميديا" then 
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:edit"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"↯︙ تم قفـل تعديل").Lock,"md",true)  
return false
end 

if text == "فتح التعديل" or text == "فتح تعديل الميديا" then 
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:edit"..msg_chat_id) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"↯︙ تم فـتح تعديل").unLock,"md",true)  
return false
end 
if text == "فتح التعديل الميديا" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:edit"..msg_chat_id) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"↯︙ تم فـتح تعديل").unLock,"md",true)  
return false
end 

if text == "الحمايه" then    
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'تعطيل الرابط', data = senderr..'/'.. 'unmute_link'},{text = 'تفعيل الرابط', data = senderr..'/'.. 'mute_link'},
},
{
{text = 'تعطيل الترحيب', data = senderr..'/'.. 'unmute_welcome'},{text = 'تفعيل الترحيب', data = senderr..'/'.. 'mute_welcome'},
},
{
{text = 'اتعطيل الايدي', data = senderr..'/'.. 'unmute_Id'},{text = 'اتفعيل الايدي', data = senderr..'/'.. 'mute_Id'},
},
{
{text = 'تعطيل الايدي بالصوره', data = senderr..'/'.. 'unmute_IdPhoto'},{text = 'تفعيل الايدي بالصوره', data = senderr..'/'.. 'mute_IdPhoto'},
},
{
{text = 'تعطيل الردود', data = senderr..'/'.. 'unmute_ryple'},{text = 'تفعيل الردود', data = senderr..'/'.. 'mute_ryple'},
},
{
{text = 'تعطيل الردود العامه', data = senderr..'/'.. 'unmute_ryplesudo'},{text = 'تفعيل الردود العامه', data = senderr..'/'.. 'mute_ryplesudo'},
},
{
{text = 'تعطيل الرفع', data = senderr..'/'.. 'unmute_setadmib'},{text = 'تفعيل الرفع', data = senderr..'/'.. 'mute_setadmib'},
},
{
{text = 'تعطيل الطرد', data = senderr..'/'.. 'unmute_kickmembars'},{text = 'تفعيل الطرد', data = senderr..'/'.. 'mute_kickmembars'},
},
{
{text = 'تعطيل الالعاب', data = senderr..'/'.. 'unmute_games'},{text = 'تفعيل الالعاب', data = senderr..'/'.. 'mute_games'},
},
{
{text = 'تعطيل اطردني', data = senderr..'/'.. 'unmute_kickme'},{text = 'تفعيل اطردني', data = senderr..'/'.. 'mute_kickme'},
},
{
{text = 'تعطيل التسليه', data = senderr..'/'.. 'unmute_thshesh'},{text = 'تفعيل التسليه', data = senderr..'/'.. 'mute_thshesh'},
},
{
{text = 'تعطيل منع التصفيه', data = senderr..'/'.. 'unmute_kicknum'},{text = 'تفعيل منع التصفيه', data = senderr..'/'.. 'mute_kicknum'},
},
{
{text = 'تعطيل الصيغ', data = senderr..'/'.. 'unmute_seck'},{text = 'تفعيل الصيغ', data = senderr..'/'.. 'mute_seck'},
},
{
{text = 'تعطيل غنيلي', data = senderr..'/'.. 'unmute_knile'},{text = 'تفعيل غنيلي', data = senderr..'/'.. 'mute_knile'},
},
{
{text = 'تعطيل الابراح', data = senderr..'/'.. 'unmute_brj'},{text = 'تفعيل الابراج', data = senderr..'/'.. 'mute_brj'},
},
{
{text = 'تعطيل الصوتيات', data = senderr..'/'.. 'unmute_audio'},{text = 'تفعيل الصوتيات', data = senderr..'/'.. 'mute_audio'},
},
{
{text = 'تعطيل الصوتيات العامه', data = senderr..'/'.. 'unmute_audioall'},{text = 'تفعيل الصوتيات العامه', data = senderr..'/'.. 'mute_audioall'},
},
{
{text = 'تعطيل تاك عام', data = senderr..'/'.. 'unmute_takall'},{text = 'تفعيل تاك عام', data = senderr..'/'.. 'mute_takall'},
},
{
{text = 'تعطيل تنبيه الاسماء', data = senderr..'/'.. 'unmute_namemy'},{text = 'تفعيل تنبيه الاسماء', data = senderr..'/'.. 'mute_namemy'},
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
return send(msg_chat_id, msg_id, '↯︙ اوامر التفعيل والتعطيل ', 'md', false, false, false, false, reply_markup)
end  
if text == 'اعدادات الحمايه' then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Link"..msg.chat_id) then
Statuslink = '⦗ ✓ ⦘' else Statuslink ='⦗ ✗ ⦘'
end
if Redis:get(Fast.."Status:Welcome"..msg.chat_id) then
StatusWelcome = '⦗ ✓ ⦘' else StatusWelcome ='⦗ ✗ ⦘'
end
if Redis:get(Fast.."Status:Id"..msg.chat_id) then
StatusId = '⦗ ✓ ⦘' else StatusId ='⦗ ✗ ⦘'
end
if Redis:get(Fast.."Status:IdPhoto"..msg.chat_id) then
StatusIdPhoto = '⦗ ✓ ⦘' else StatusIdPhoto ='⦗ ✗ ⦘'
end
if Redis:get(Fast.."Status:Reply"..msg.chat_id) then
StatusReply = '⦗ ✓ ⦘' else StatusReply ='⦗ ✗ ⦘'
end
if Redis:get(Fast.."Status:ReplySudo"..msg.chat_id) then
StatusReplySudo = '⦗ ✓ ⦘' else StatusReplySudo ='⦗ ✗ ⦘'
end
if Redis:get(Fast.."Status:BanId"..msg.chat_id)  then
StatusBanId = '⦗ ✓ ⦘' else StatusBanId ='⦗ ✗ ⦘'
end
if Redis:get(Fast.."Status:SetId"..msg.chat_id) then
StatusSetId = '⦗ ✓ ⦘' else StatusSetId ='⦗ ✗ ⦘'
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
StatusGames = '⦗ ✓ ⦘' else StatusGames ='⦗ ✗ ⦘'
end
if Redis:get(Fast.."Status:KickMe"..msg.chat_id) then
Statuskickme = '⦗ ✓ ⦘' else Statuskickme ='⦗ ✗ ⦘'
end
if Redis:get(Fast.."Status:AddMe"..msg.chat_id) then
StatusAddme = '⦗ ✓ ⦘' else StatusAddme ='⦗ ✗ ⦘'
end
local protectionGroup = '\n*↯︙ اعدادات حمايه الكروب\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n'
..'\n↯︙ جلب الرابط ➤ '..Statuslink
..'\n↯︙ جلب الترحيب ➤ '..StatusWelcome
..'\n↯︙ الايدي ➤ '..StatusId
..'\n↯︙ الايدي بالصوره ➤ '..StatusIdPhoto
..'\n↯︙ الردود ➤ '..StatusReply
..'\n↯︙ الردود العامه ➤ '..StatusReplySudo
..'\n↯︙ الرفع ➤ '..StatusSetId
..'\n↯︙ الحظر - الطرد ➤ '..StatusBanId
..'\n↯︙ الالعاب ➤ '..StatusGames
..'\n↯︙ امر اطردني ➤ '..Statuskickme..'*\n\n.'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
return send(msg_chat_id, msg_id,protectionGroup,'md', false, false, false, false, reply_markup)
end
if text == "الاعدادات" then    
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Text = "*\n↯︙ اعدادات الكروب ".."\n↯︙ علامة ال (✓) تعني مقفول".."\n↯︙ علامة ال (✗) تعني مفتوح*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(msg_chat_id).lock_links, data = '&'},{text = 'الروابط : ', data =senderr..'/'.. 'Status_link'},
},
{
{text = GetSetieng(msg_chat_id).lock_spam, data = '&'},{text = 'الكلايش : ', data =senderr..'/'.. 'Status_spam'},
},
{
{text = GetSetieng(msg_chat_id).lock_inlin, data = '&'},{text = 'الكيبورد : ', data =senderr..'/'.. 'Status_keypord'},
},
{
{text = GetSetieng(msg_chat_id).lock_vico, data = '&'},{text = 'الاغاني : ', data =senderr..'/'.. 'Status_voice'},
},
{
{text = GetSetieng(msg_chat_id).lock_gif, data = '&'},{text = 'المتحركه : ', data =senderr..'/'.. 'Status_gif'},
},
{
{text = GetSetieng(msg_chat_id).lock_file, data = '&'},{text = 'الملفات : ', data =senderr..'/'.. 'Status_files'},
},
{
{text = GetSetieng(msg_chat_id).lock_text, data = '&'},{text = 'الدردشه : ', data =senderr..'/'.. 'Status_text'},
},
{
{text = GetSetieng(msg_chat_id).lock_ved, data = '&'},{text = 'الفيديو : ', data =senderr..'/'.. 'Status_video'},
},
{
{text = GetSetieng(msg_chat_id).lock_photo, data = '&'},{text = 'الصور : ', data =senderr..'/'.. 'Status_photo'},
},
{
{text = GetSetieng(msg_chat_id).lock_user, data = '&'},{text = 'المعرفات : ', data =senderr..'/'.. 'Status_username'},
},
{
{text = GetSetieng(msg_chat_id).lock_hash, data = '&'},{text = 'التاك : ', data =senderr..'/'.. 'Status_tags'},
},
{
{text = GetSetieng(msg_chat_id).lock_bots, data = '&'},{text = 'البوتات : ', data =senderr..'/'.. 'Status_bots'},
},
{
{text = GetSetieng(msg_chat_id).farsia, data = '&'},{text = 'الفارسيه : ', data =senderr..'/'.. 'Status_farsia'},
},
{
{text = GetSetieng(msg_chat_id).tphlesh, data = '&'},{text = 'التفليش : ', data =senderr..'/'.. 'Status_tphlesh'},
},
{
{text = GetSetieng(msg_chat_id).alkfr, data = '&'},{text = 'الكفر : ', data =senderr..'/'.. 'Status_alkfr'},
},
{
{text = GetSetieng(msg_chat_id).alphsar, data = '&'},{text = 'الفشار : ', data =senderr..'/'.. 'Status_alphsar'},
},
{
{text = '- التالي ... ', data =senderr..'/'.. 'NextSeting'}
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
return send(msg_chat_id, msg_id, Text, 'md', false, false, false, false, reply_markup)
end  


if text == 'الكروب' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*↯︙ عذرآ البوت ليس ادمن في الكروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local Get_Chat = bot.getChat(msg_chat_id)
if Get_Chat.permissions.can_add_web_page_previews then
web = '⦗ ✓ ⦘' else web ='⦗ ✗ ⦘'
end
if Get_Chat.permissions.can_change_info then
info = '⦗ ✓ ⦘' else info ='⦗ ✗ ⦘'
end
if Get_Chat.permissions.can_invite_users then
invite = '⦗ ✓ ⦘' else invite ='⦗ ✗ ⦘'
end
if Get_Chat.permissions.can_pin_messages then
pin = '⦗ ✓ ⦘' else pin ='⦗ ✗ ⦘'
end
if Get_Chat.permissions.can_send_media_messages then
media = '⦗ ✓ ⦘' else media ='⦗ ✗ ⦘'
end
if Get_Chat.permissions.can_send_messages then
messges = '⦗ ✓ ⦘' else messges ='⦗ ✗ ⦘'
end
if Get_Chat.permissions.can_send_other_messages then
other = '⦗ ✓ ⦘' else other ='⦗ ✗ ⦘'
end
if Get_Chat.permissions.can_send_polls then
polls = '⦗ ✓ ⦘' else polls ='⦗ ✗ ⦘'
end
local permissions = '*\n↯︙ صلاحيات الكروب :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..'\n↯︙ ارسال الويب : '..web..'\n↯︙ تغيير معلومات الكروب : '..info..'\n↯︙ اضافه مستخدمين : '..invite..'\n↯︙ تثبيت الرسائل : '..pin..'\n↯︙ ارسال الميديا : '..media..'\n↯︙ ارسال الرسائل : '..messges..'\n↯︙ اضافه البوتات : '..other..'\n↯︙ ارسال استفتاء : '..polls..'*\n\n'
local TextChat = '*\n↯︙ معلومات الكروب :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..' \n↯︙ اسم الكروب : ❬* ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* ❭\n↯︙ عدد الادمنيه : ❬ '..Info_Chats.administrator_count..' ❭\n↯︙ عدد المحظورين : ❬ '..Info_Chats.banned_count..' ❭\n↯︙ عدد الاعضاء : ❬ '..Info_Chats.member_count..' ❭\n↯︙ عدد المقيديين : ❬ '..Info_Chats.restricted_count..' ❭\n↯︙ الايدي : ❬ *`'..msg.chat_id..'`* ❭*\n'
if Info_Chats.photo then
bot.sendPhoto(msg.chat_id, msg.id, Info_Chats.photo.sizes[1].photo.remote.id,TextChat..permissions, "md")
else
return send(msg_chat_id,msg_id, TextChat..permissions,"md",true)
end
end

if text=="اذاعه خاص" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Users" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,[[
↯︙ارسل لي سواء كان 
❨ ملف ↯︙ملصق ↯︙متحركه ↯︙صوره
 ↯︙فيديو ↯︙بصمه الفيديو ↯︙بصمه ↯︙صوت ↯︙رساله ❩
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
↯︙للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Groups" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,[[
↯︙ارسل لي سواء كان 
❨ ملف ↯︙ملصق ↯︙متحركه ↯︙صوره
 ↯︙فيديو ↯︙بصمه الفيديو ↯︙بصمه ↯︙صوت ↯︙رساله ❩
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
↯︙للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه بالتثبيت" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,[[
↯︙ارسل لي سواء كان 
❨ ملف ↯︙ملصق ↯︙متحركه ↯︙صوره
 ↯︙فيديو ↯︙بصمه الفيديو ↯︙بصمه ↯︙صوت ↯︙رساله ❩
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
↯︙للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه بالتوجيه" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,"↯︙ ارسل لي التوجيه الان\n↯︙ ليتم نشره في المجموعات","md",true)  
return false
end

if text=="اذاعه خاص بالتوجيه" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,"↯︙ ارسل لي التوجيه الان\n↯︙ ليتم نشره الى المشتركين","md",true)  
return false
end
if text == 'كشف القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*↯︙ عذرآ البوت ليس ادمن في الكروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,rep_idd).status 
if GetMemberStatus.Fastbots == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,rep_idd).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,rep_idd).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,rep_idd).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
send(msg_chat_id,msg_id,"\n*↯︙ معلومات الكشف \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"..'\n↯︙ الحظر العام : '..BanAll..'\n↯︙ الحظر : '..BanGroup..'\n↯︙ الكتم : '..SilentGroup..'\n↯︙ التقييد : '..Restricted..'*',"md",true)  
end
if text and text:match('^كشف القيود @(%S+)$') then
local UserName = text:match('^كشف القيود @(%S+)$')
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*↯︙ عذرآ البوت ليس ادمن في الكروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف قناة او الكروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,UserId_Info.id).status 
if GetMemberStatus.Fastbots == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
send(msg_chat_id,msg_id,"\n*↯︙ معلومات الكشف \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"..'\n↯︙ الحظر العام : '..BanAll..'\n↯︙ الحظر : '..BanGroup..'\n↯︙ الكتم : '..SilentGroup..'\n↯︙ التقييد : '..Restricted..'*',"md",true)  
end
if text == 'رفع القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*↯︙ عذرآ البوت ليس ادمن في الكروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,rep_idd).status 
if GetMemberStatus.Fastbots == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1})
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,rep_idd).BanAll == true and msg.Asasy then
BanAll = 'محظور عام ,'
Redis:srem(Fast.."BanAll:Groups",rep_idd) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,rep_idd).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(Fast.."BanGroup:Group"..msg_chat_id,rep_idd) 
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1,1})
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,rep_idd).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(Fast.."SilentGroup:Group"..msg_chat_id,rep_idd) 
else
SilentGroup = ''
end
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1,1})
send(msg_chat_id,msg_id,"\n*↯︙ تم رفع القيود عنه : {"..BanAll..BanGroup..SilentGroup..Restricted..'}*',"md",true)  
end
if text and text:match('^رفع القيود @(%S+)$') then
local UserName = text:match('^رفع القيود @(%S+)$')
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*↯︙ عذرآ البوت ليس ادمن في الكروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف قناة او الكروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,UserId_Info.id).status 
if GetMemberStatus.Fastbots == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1})
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true and msg.Asasy then
BanAll = 'محظور عام ,'
Redis:srem(Fast.."BanAll:Groups",UserId_Info.id) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(Fast.."BanGroup:Group"..msg_chat_id,UserId_Info.id) 
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(Fast.."SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
else
SilentGroup = ''
end
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
send(msg_chat_id,msg_id,"\n*↯︙ تم رفع القيود عنه : {"..BanAll..BanGroup..SilentGroup..Restricted..'}*',"md",true)  
end

if text == 'ضع كليشه المطور' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'GetTexting:DevFast'..msg_chat_id..':'..senderr,true)
return send(msg_chat_id,msg_id,'↯︙ ارسل لي الكليشه الان')
end
if text == 'مسح كليشة المطور' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast..'Texting:DevFast')
return send(msg_chat_id,msg_id,'↯︙ تم مسح كليشه المطور')
end
---استبدال كلمه--
if text == "استبدال كلمه" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast..msg.chat_id..senderr.."replace",true)
return bot.sendText(msg_chat_id,msg_id,'\n↯︙ ارسل الكلمه القديمه ليتم استبدالها',"md",true)  
end
if text == "مسح الكلمات المستبدله" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
local list = Redis:smembers(Fast.."Words:r")
for k,v in pairs(list) do
Redis:del(Fast.."Word:Replace"..v)
end
Redis:del(Fast.."Words:r")
send(msg_chat_id,msg_id,"↯︙ تم مسح الكلمات المستبدله")
end
if text == "الكلمات المستبدله" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
local list = Redis:smembers(Fast.."Words:r")
if #list == 0 then
return send(msg.chat_id,msg.id,"↯︙ لا توجد كلمات مستبدله")
end
local txx = " قائمه الكلمات المستبدله \n"
for k,v in pairs(list) do 
cmdd = Redis:get(Fast.."Word:Replace"..v)
txx = txx..k.." - "..v.." »» "..cmdd.."\n"
end
bot.sendText(msg_chat_id,msg_id,txx)
end
----
if text == ("مسح الردود الانلاين") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هاذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager:inline"..msg_chat_id.."")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Manager:Gif:inline"..v..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline"..v..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline"..v..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline"..v..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline"..v..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:v"..v..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:link"..v..msg_chat_id)
Redis:del(Fast.."List:Manager:inline"..msg_chat_id)
end
return send(msg_chat_id,msg_id,"↯︙ تم مسح قائمه الانلاين","md",true)
end
if text == "اضف رد انلاين" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هاذا الامر يخص '..Controller_Num(7)..' * ',"md",true)
end
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
return send(msg_chat_id,msg_id,"↯︙ ارسل الان الكلمه لاضافتها في الردود ","md",false, false, false, false, reply_markup)
end
if text and text:match("^(.*)$") and tonumber(senderr) ~= tonumber(Fast) then
if Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id) == "true" then
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id,"true1")
Redis:set(Fast.."Text:Manager:inline"..senderr..":"..msg_chat_id, text)
Redis:del(Fast.."Add:Rd:Manager:Gif:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline"..text..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:text"..text..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:link"..text..msg_chat_id)
Redis:sadd(Fast.."List:Manager:inline"..msg_chat_id.."", text)
send(msg_chat_id,msg_id,[[
↯︙ارسل لي الرد سواء كان 
❨ ملف ، ملصق ، متحركه ، صوره
 ، فيديو ، بصمه الفيديو ، بصمه ، صوت ، رساله ❩
↯︙يمكنك اضافة الى النص ↯︙
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id.."") == "true2" then
Redis:del(Fast.."Add:Rd:Manager:Gif:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline"..text..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:text"..text..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:link"..text..msg_chat_id)
Redis:del(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id.."")
Redis:srem(Fast.."List:Manager:inline"..msg_chat_id.."", text)
send(msg_chat_id,msg_id,"↯︙ تم حذف الرد من الردود الانلاين ","md",true)
return false
end
end
if Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id) == "true1" and tonumber(senderr) ~= tonumber(Fast) then
Redis:del(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id,"set_inline")
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local anubis = Redis:get(Fast.."Text:Manager:inline"..senderr..":"..msg_chat_id)
if msg.content.text then 
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Fast.."Add:Rd:Manager:Text:inline"..anubis..msg_chat_id, text)
elseif msg.content.sticker then 
Redis:set(Fast.."Add:Rd:Manager:Stekrs:inline"..anubis..msg_chat_id, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then
Redis:set(Fast.."Add:Rd:Manager:Vico:inline"..anubis..msg_chat_id, msg.content.voice_note.voice.remote.id)
elseif msg.content.audio then
Redis:set(Fast.."Add:Rd:Manager:Audio:inline"..anubis..msg_chat_id, msg.content.audio.audio.remote.id)
Redis:set(Fast.."Add:Rd:Manager:Audioc:inline"..anubis..msg_chat_id, msg.content.caption.text)
elseif msg.content.document then
Redis:set(Fast.."Add:Rd:Manager:File:inline"..anubis..msg_chat_id, msg.content.document.document.remote.id)
elseif msg.content.animation then
Redis:set(Fast.."Add:Rd:Manager:Gif:inline"..anubis..msg_chat_id, msg.content.animation.animation.remote.id)
elseif msg.content.video_note then
Redis:set(Fast.."Add:Rd:Manager:video_note:inline"..anubis..msg_chat_id, msg.content.video_note.video.remote.id)
elseif msg.content.video then
Redis:set(Fast.."Add:Rd:Manager:Video:inline"..anubis..msg_chat_id, msg.content.video.video.remote.id)
Redis:set(Fast.."Add:Rd:Manager:Videoc:inline"..anubis..msg_chat_id, msg.content.caption.text)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Add:Rd:Manager:Photo:inline"..anubis..msg_chat_id, idPhoto)
Redis:set(Fast.."Add:Rd:Manager:Photoc:inline"..anubis..msg_chat_id, msg.content.caption.text)
end
send(msg_chat_id,msg_id,"↯︙ الان ارسل الكلام داخل الزر","md",true)
return false
end
end
if text and Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id) == "set_inline" then
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id, "set_link")
local anubis = Redis:get(Fast.."Text:Manager:inline"..senderr..":"..msg_chat_id)
Redis:sadd(Fast.."Rd:Manager:inline:text"..anubis..msg_chat_id, text)
Redis:set(Fast.."Text:Manager:inline:link:"..senderr..":"..msg_chat_id, text)
send(msg_chat_id,msg_id,"↯︙ الان ارسل الرابط","md",true)
return false
end
if text and Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id) == "set_link" then
local anubis = Redis:get(Fast.."Text:Manager:inline"..senderr..":"..msg_chat_id)
local anubis2 = Redis:get(Fast.."Text:Manager:inline:link:"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Rd:Manager:inline:link:"..anubis2..":"..msg_chat_id..":"..anubis, text)
Redis:del(Fast.."Text:Manager:inline:link:"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id, "set_inline")
local reply_markup = bot.replyMarkup{
  type = 'inline',
  data = {
    {
      {text = "انهاء" , data = msg.sender_id.user_id.."/cancelinline"}
    }
  }
  }
send(msg_chat_id,msg_id,"↯︙ تم اضافه الرد بنجاح\n↯︙ ارسل اسم الزر التالي الان او انهاء للانهاء","md",false, false, false, false, reply_markup)
return false
end
if text and not Redis:get(Fast.."Status:Reply:inline"..msg_chat_id) then
local btext = Redis:smembers(Fast.."Rd:Manager:inline:text"..text..msg_chat_id)
local anemi = Redis:get(Fast.."Add:Rd:Manager:Gif:inline"..text..msg_chat_id) 
local veico = Redis:get(Fast.."Add:Rd:Manager:Vico:inline"..text..msg_chat_id) 
local stekr = Redis:get(Fast.."Add:Rd:Manager:Stekrs:inline"..text..msg_chat_id) 
local Texingt = Redis:get(Fast.."Add:Rd:Manager:Text:inline"..text..msg_chat_id) 
local photo = Redis:get(Fast.."Add:Rd:Manager:Photo:inline"..text..msg_chat_id)
local photoc = Redis:get(Fast.."Add:Rd:Manager:Photoc:inline"..text..msg_chat_id)
local video = Redis:get(Fast.."Add:Rd:Manager:Video:inline"..text..msg_chat_id)
local videoc = Redis:get(Fast.."Add:Rd:Manager:Videoc:inline"..text..msg_chat_id)
local document = Redis:get(Fast.."Add:Rd:Manager:File:inline"..text..msg_chat_id)
local audio = Redis:get(Fast.."Add:Rd:Manager:Audio:inline"..text..msg_chat_id)
local audioc = Redis:get(Fast.."Add:Rd:Manager:Audioc:inline"..text..msg_chat_id)
local video_note = Redis:get(Fast.."Add:Rd:Manager:video_note:inline"..text..msg_chat_id)
local inline_anubis = {data = {}}
for k,v in pairs(btext) do
local blink = Redis:get(Fast.."Rd:Manager:inline:link:"..v..":"..msg_chat_id..":"..text)
inline_anubis[k] = {{text = v , url = blink}}
end
local reply_markup = bot.replyMarkup{
      type = 'inline',
      data = inline_anubis
      }
if Texingt then 
local UserInfo = bot.getUser(senderr)
local NumMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..senderr) or 0
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',FlterBio(UserInfo.first_name))
local Texingt = Texingt:gsub('#id',senderr)
local Texingt = Texingt:gsub('#edit',NumMessageEdit)
local Texingt = Texingt:gsub('#msgs',NumMsg)
local Texingt = Texingt:gsub('#stast',Status_Gps)
send(msg_chat_id,msg_id,Texingt,"md",false, false, false, false, reply_markup)
end
if video_note then
bot.sendVideoNote(msg_chat_id, msg.id, video_note, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if photo then
bot.sendPhoto(msg.chat_id, msg.id, photo,photoc,"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup )
end
if stekr then 
bot.sendSticker(msg_chat_id, msg.id, stekr,nil,nil,nil,nil,nil,nil,nil,reply_markup)
end
if veico then 
bot.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md',nil, nil, nil, nil, reply_markup)
end
if video then 
bot.sendVideo(msg_chat_id, msg.id, video, videoc, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if anemi then 
bot.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md', nil, nil, nil, nil, nil, nil, nil, nil,reply_markup)
end
if document then
bot.sendDocument(msg_chat_id, msg.id, document, '', 'md',nil, nil, nil, nil,nil, reply_markup)
end
if audio then
bot.sendAudio(msg_chat_id, msg.id, audio, audioc, "md", nil, nil, nil, nil, nil, nil, nil, nil,reply_markup) 
end
end
if text == "حذف رد انلاين" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هاذا الامر يخص '..Controller_Num(7)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id,"true2")
return send(msg_chat_id,msg_id,"↯︙ ارسل الان الكلمه لحذفها من الردود الانلاين","md",false, false, false, false, reply_markup)
end 

if text == ("الردود الانلاين") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هاذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager:inline"..msg_chat_id.."")
text = "↯︙ قائمه الردود الانلاين \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Manager:Gif:inline"..v..msg_chat_id) then
db = "متحركه ↯︙"
elseif Redis:get(Fast.."Add:Rd:Manager:Vico:inline"..v..msg_chat_id) then
db = "بصمه ↯︙"
elseif Redis:get(Fast.."Add:Rd:Manager:Stekrs:inline"..v..msg_chat_id) then
db = "ملصق ↯︙"
elseif Redis:get(Fast.."Add:Rd:Manager:Text:inline"..v..msg_chat_id) then
db = "رساله ↯︙"
elseif Redis:get(Fast.."Add:Rd:Manager:Photo:inline"..v..msg_chat_id) then
db = "صوره ↯︙"
elseif Redis:get(Fast.."Add:Rd:Manager:Video:inline"..v..msg_chat_id) then
db = "فيديو ↯︙"
elseif Redis:get(Fast.."Add:Rd:Manager:File:inline"..v..msg_chat_id) then
db = "ملف ↯︙"
elseif Redis:get(Fast.."Add:Rd:Manager:Audio:inline"..v..msg_chat_id) then
db = "اغنيه ↯︙"
elseif Redis:get(Fast.."Add:Rd:Manager:video_note:inline"..v..msg_chat_id) then
db = "بصمه فيديو ↯︙"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "↯︙ عذرا لا يوجد ردود انلاين في الكروب"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)
end
---------
if text == ("مسح الردود الانلاين عام") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هاذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager:inline:sudo")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Manager:Gif:inline:sudo"..v) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline:sudo"..v) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline:sudo"..v) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline:sudo"..v) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline:sudo"..v)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline:sudo"..v)
Redis:del(Fast.."Add:Rd:Manager:Video:inline:sudo"..v)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline:sudo"..v)
Redis:del(Fast.."Add:Rd:Manager:File:inline:sudo"..v)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline:sudo"..v)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline:sudo"..v)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline:sudo"..v)
Redis:del(Fast.."Rd:Manager:inline:sudo:v"..v)
Redis:del(Fast.."Rd:Manager:inline:sudo:link"..v)
Redis:del(Fast.."List:Manager:inline:sudo")
end
return send(msg_chat_id,msg_id,"↯︙ تم مسح قائمه الانلاين عام","md",true)
end
if text == "اضف رد انلاين عام" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هاذا الامر يخص '..Controller_Num(7)..' * ',"md",true)
end
Redis:set(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
return send(msg_chat_id,msg_id,"↯︙ ارسل الان الكلمه لاضافتها في الردود ","md",false, false, false, false, reply_markup)
end
if text and text:match("^(.*)$") and tonumber(senderr) ~= tonumber(Fast) then
if Redis:get(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id) == "true" then
Redis:set(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id,"true1")
Redis:set(Fast.."Text:Manager:inline:sudo"..senderr..":"..msg_chat_id, text)
Redis:del(Fast.."Add:Rd:Manager:Gif:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Video:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:File:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline:sudo"..text)
Redis:del(Fast.."Rd:Manager:inline:sudo:text"..text)
Redis:del(Fast.."Rd:Manager:inline:sudo:link"..text)
Redis:sadd(Fast.."List:Manager:inline:sudo", text)
send(msg_chat_id,msg_id,[[
↯︙ارسل لي الرد سواء كان 
❨ ملف ، ملصق ، متحركه ، صوره
 ، فيديو ، بصمه الفيديو ، بصمه ، صوت ، رساله ❩
↯︙يمكنك اضافة الى النص ↯︙
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id.."") == "true2" then
Redis:del(Fast.."Add:Rd:Manager:Gif:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Video:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:File:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline:sudo"..text)
Redis:del(Fast.."Rd:Manager:inline:sudo:text"..text)
Redis:del(Fast.."Rd:Manager:inline:sudo:link"..text)
Redis:del(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id.."")
Redis:srem(Fast.."List:Manager:inline:sudo", text)
send(msg_chat_id,msg_id,"↯︙ تم حذف الرد من الردود الانلاين عام ","md",true)
return false
end
end
if Redis:get(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id) == "true1" and tonumber(senderr) ~= tonumber(Fast) then
Redis:del(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id,"set_inline")
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local anubis = Redis:get(Fast.."Text:Manager:inline:sudo"..senderr..":"..msg_chat_id)
if msg.content.text then 
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Fast.."Add:Rd:Manager:Text:inline:sudo"..anubis, text)
elseif msg.content.sticker then 
Redis:set(Fast.."Add:Rd:Manager:Stekrs:inline:sudo"..anubis, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then
Redis:set(Fast.."Add:Rd:Manager:Vico:inline:sudo"..anubis, msg.content.voice_note.voice.remote.id)
elseif msg.content.audio then
Redis:set(Fast.."Add:Rd:Manager:Audio:inline:sudo"..anubis, msg.content.audio.audio.remote.id)
Redis:set(Fast.."Add:Rd:Manager:Audioc:inline:sudo"..anubis, msg.content.caption.text)
elseif msg.content.document then
Redis:set(Fast.."Add:Rd:Manager:File:inline:sudo"..anubis, msg.content.document.document.remote.id)
elseif msg.content.animation then
Redis:set(Fast.."Add:Rd:Manager:Gif:inline:sudo"..anubis, msg.content.animation.animation.remote.id)
elseif msg.content.video_note then
Redis:set(Fast.."Add:Rd:Manager:video_note:inline:sudo"..anubis, msg.content.video_note.video.remote.id)
elseif msg.content.video then
Redis:set(Fast.."Add:Rd:Manager:Video:inline:sudo"..anubis, msg.content.video.video.remote.id)
Redis:set(Fast.."Add:Rd:Manager:Videoc:inline:sudo"..anubis, msg.content.caption.text)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Add:Rd:Manager:Photo:inline:sudo"..anubis, idPhoto)
Redis:set(Fast.."Add:Rd:Manager:Photoc:inline:sudo"..anubis, msg.content.caption.text)
end
send(msg_chat_id,msg_id,"↯︙ الان ارسل الكلام داخل الزر","md",true)
return false
end
end
if text and Redis:get(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id) == "set_inline" then
Redis:set(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id, "set_link")
local anubis = Redis:get(Fast.."Text:Manager:inline:sudo"..senderr..":"..msg_chat_id)
Redis:sadd(Fast.."Rd:Manager:inline:sudo:text"..anubis, text)
Redis:set(Fast.."Text:Manager:inline:sudo:link:"..senderr..":"..msg_chat_id, text)
send(msg_chat_id,msg_id,"↯︙ الان ارسل الرابط","md",true)
return false
end
if text and Redis:get(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id) == "set_link" then
local anubis = Redis:get(Fast.."Text:Manager:inline:sudo"..senderr..":"..msg_chat_id)
local anubis2 = Redis:get(Fast.."Text:Manager:inline:sudo:link:"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Rd:Manager:inline:sudo:link:"..anubis2..":"..anubis, text)
Redis:del(Fast.."Text:Manager:inline:sudo:link:"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id, "set_inline")
local reply_markup = bot.replyMarkup{
  type = 'inline',
  data = {
    {
      {text = "انهاء" , data = msg.sender_id.user_id.."/cancelinline"}
    }
  }
  }
send(msg_chat_id,msg_id,"↯︙ تم اضافه الرد بنجاح\n↯︙ ارسل اسم الزر التالي الان او انهاء للانهاء","md",false, false, false, false, reply_markup)
return false
end
if text and not Redis:get(Fast.."Status:Reply:inline:sudo"..msg_chat_id) then
local btext = Redis:smembers(Fast.."Rd:Manager:inline:sudo:text"..text)
local anemi = Redis:get(Fast.."Add:Rd:Manager:Gif:inline:sudo"..text) 
local veico = Redis:get(Fast.."Add:Rd:Manager:Vico:inline:sudo"..text) 
local stekr = Redis:get(Fast.."Add:Rd:Manager:Stekrs:inline:sudo"..text) 
local Texingt = Redis:get(Fast.."Add:Rd:Manager:Text:inline:sudo"..text) 
local photo = Redis:get(Fast.."Add:Rd:Manager:Photo:inline:sudo"..text)
local photoc = Redis:get(Fast.."Add:Rd:Manager:Photoc:inline:sudo"..text)
local video = Redis:get(Fast.."Add:Rd:Manager:Video:inline:sudo"..text)
local videoc = Redis:get(Fast.."Add:Rd:Manager:Videoc:inline:sudo"..text)
local document = Redis:get(Fast.."Add:Rd:Manager:File:inline:sudo"..text)
local audio = Redis:get(Fast.."Add:Rd:Manager:Audio:inline:sudo"..text)
local audioc = Redis:get(Fast.."Add:Rd:Manager:Audioc:inline:sudo"..text)
local video_note = Redis:get(Fast.."Add:Rd:Manager:video_note:inline:sudo"..text)
local inline_anubis = {data = {}}
for k,v in pairs(btext) do
local blink = Redis:get(Fast.."Rd:Manager:inline:sudo:link:"..v..":"..text)
inline_anubis[k] = {{text = v , url = blink}}
end
local reply_markup = bot.replyMarkup{
      type = 'inline',
      data = inline_anubis
      }
if Texingt then 
local UserInfo = bot.getUser(senderr)
local NumMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..senderr) or 0
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',FlterBio(UserInfo.first_name))
local Texingt = Texingt:gsub('#id',senderr)
local Texingt = Texingt:gsub('#edit',NumMessageEdit)
local Texingt = Texingt:gsub('#msgs',NumMsg)
local Texingt = Texingt:gsub('#stast',Status_Gps)
send(msg_chat_id,msg_id,Texingt,"md",false, false, false, false, reply_markup)
end
if video_note then
bot.sendVideoNote(msg_chat_id, msg.id, video_note, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if photo then
bot.sendPhoto(msg.chat_id, msg.id, photo,photoc,"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup )
end
if stekr then 
bot.sendSticker(msg_chat_id, msg.id, stekr,nil,nil,nil,nil,nil,nil,nil,reply_markup)
end
if veico then 
bot.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md',nil, nil, nil, nil, reply_markup)
end
if video then 
bot.sendVideo(msg_chat_id, msg.id, video, videoc, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if anemi then 
bot.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md', nil, nil, nil, nil, nil, nil, nil, nil,reply_markup)
end
if document then
bot.sendDocument(msg_chat_id, msg.id, document, '', 'md',nil, nil, nil, nil,nil, reply_markup)
end
if audio then
bot.sendAudio(msg_chat_id, msg.id, audio, audioc, "md", nil, nil, nil, nil, nil, nil, nil, nil,reply_markup) 
end
end
if text == "حذف رد انلاين عام" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هاذا الامر يخص '..Controller_Num(7)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
Redis:set(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id,"true2")
return send(msg_chat_id,msg_id,"↯︙ ارسل الان الكلمه لحذفها من الردود الانلاين عام","md",false, false, false, false, reply_markup)
end 

if text == ("الردود الانلاين عام") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هاذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager:inline:sudo")
text = "↯︙ قائمه الردود الانلاين عام \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Manager:Gif:inline:sudo"..v) then
db = "متحركه ↯︙"
elseif Redis:get(Fast.."Add:Rd:Manager:Vico:inline:sudo"..v) then
db = "بصمه ↯︙"
elseif Redis:get(Fast.."Add:Rd:Manager:Stekrs:inline:sudo"..v) then
db = "ملصق ↯︙"
elseif Redis:get(Fast.."Add:Rd:Manager:Text:inline:sudo"..v) then
db = "رساله ↯︙"
elseif Redis:get(Fast.."Add:Rd:Manager:Photo:inline:sudo"..v) then
db = "صوره ↯︙"
elseif Redis:get(Fast.."Add:Rd:Manager:Video:inline:sudo"..v) then
db = "فيديو ↯︙"
elseif Redis:get(Fast.."Add:Rd:Manager:File:inline:sudo"..v) then
db = "ملف ↯︙"
elseif Redis:get(Fast.."Add:Rd:Manager:Audio:inline:sudo"..v) then
db = "اغنيه ↯︙"
elseif Redis:get(Fast.."Add:Rd:Manager:video_note:inline:sudo"..v) then
db = "بصمه فيديو ↯︙"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "↯︙ عذرا لا يوجد ردود انلاين عام في الكروب"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)
end
--------------

if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo and senderr ~= Fast then
local test = Redis:get(Fast.."Text:Sudo:Bot"..senderr..":"..msg_chat_id)
if Redis:get(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id) == "true1" then
Redis:del(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id)
if msg.content.text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Fast.."Add:Rd:Sudo:mz:Text"..test, text)  
elseif msg.content.sticker then   
Redis:set(Fast.."Add:Rd:Sudo:mz:stekr"..test, msg.content.sticker.sticker.remote.id)  
elseif msg.content.voice_note then  
Redis:set(Fast.."Add:Rd:Sudo:mz:vico"..test, msg.content.voice_note.voice.remote.id)  
elseif msg.content.animation then   
Redis:set(Fast.."Add:Rd:Sudo:mz:Gif"..test, msg.content.animation.animation.remote.id)  
elseif msg.content.audio then
Redis:set(Fast.."Add:Rd:Sudo:mz:Audio"..test, msg.content.audio.audio.remote.id)  
Redis:set(Fast.."Add:Rd:Sudo:mz:Audioc"..test, msg.content.caption.text)  
elseif msg.content.document then
Redis:set(Fast.."Add:Rd:Sudo:mz:File"..test, msg.content.document.document.remote.id)  
elseif msg.content.video then
Redis:set(Fast.."Add:Rd:Sudo:mz:Video"..test, msg.content.video.video.remote.id)  
Redis:set(Fast.."Add:Rd:Sudo:mz:Videoc"..test, msg.content.caption.text)  
elseif msg.content.video_note then
Redis:set(Fast.."Add:Rd:Sudo:mz:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Add:Rd:Sudo:mz:Photo"..test, idPhoto)  
Redis:set(Fast.."Add:Rd:Sudo:mz:Photoc"..test, msg.content.caption.text)  
end
send(msg_chat_id,msg_id,"↯︙ تم حفظ الرد \n↯︙ ارسل ( "..test.." ) لرئية الرد","md",true)  
return false
end  
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id) == "true" then
Redis:set(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id, "true1")
Redis:set(Fast.."Text:Sudo:Bot"..senderr..":"..msg_chat_id, text)
Redis:sadd(Fast.."List:Rd:Sudo:mz", text)
send(msg_chat_id,msg_id,[[
↯︙ارسل لي الرد سواء كان 
❨ ملف ، ملصق ، متحركه ، صوره
 ، فيديو ، بصمه الفيديو ، بصمه ، صوت ، رساله ❩
↯︙يمكنك اضافة الى النص ↯︙
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)  
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:On:mz"..senderr..":"..msg_chat_id) == "true" then
list = {"Add:Rd:Sudo:mz:video_note","Add:Rd:Sudo:mz:Audio","Add:Rd:Sudo:mz:Audioc","Add:Rd:Sudo:mz:File","Add:Rd:Sudo:mz:Video","Add:Rd:Sudo:mz:Videoc","Add:Rd:Sudo:mz:Photo","Add:Rd:Sudo:mz:Photoc","Add:Rd:Sudo:mz:Text","Add:Rd:Sudo:mz:stekr","Add:Rd:Sudo:mz:vico","Add:Rd:Sudo:mz:Gif"}
for k,v in pairs(list) do
Redis:del(Fast..''..v..text)
end
Redis:del(Fast.."Set:On:mz"..senderr..":"..msg_chat_id)
Redis:srem(Fast.."List:Rd:Sudo:mz", text)
return send(msg_chat_id,msg_id,"↯︙ تم حذف الرد من الردود العامه","md",true)  
end
end

if text and text ~= "حذف رد مميز" and text ~= "اضف رد مميز" and text ~= "مسح الردود المميزه" then
local listmz = Redis:smembers(Fast.."List:Rd:Sudo:mz")
for k,v in pairs(listmz) do
i ,j  = string.find(text, v)
if j and i then
local x = string.sub(text, i,j)

if x then
local anemi = Redis:get(Fast.."Add:Rd:Sudo:mz:Gif"..x)   
local veico = Redis:get(Fast.."Add:Rd:Sudo:mz:vico"..x)   
local stekr = Redis:get(Fast.."Add:Rd:Sudo:mz:stekr"..x)     
local Text = Redis:get(Fast.."Add:Rd:Sudo:mz:Text"..x)   
local photo = Redis:get(Fast.."Add:Rd:Sudo:mz:Photo"..x)
local photoc = Redis:get(Fast.."Add:Rd:Sudo:mz:Photoc"..x)
local video = Redis:get(Fast.."Add:Rd:Sudo:mz:Video"..x)
local videoc = Redis:get(Fast.."Add:Rd:Sudo:mz:Videoc"..x)
local document = Redis:get(Fast.."Add:Rd:Sudo:mz:File"..x)
local audio = Redis:get(Fast.."Add:Rd:Sudo:mz:Audio"..x)
local audioc = Redis:get(Fast.."Add:Rd:Sudo:mz:Audioc"..x)
local video_note = Redis:get(Fast.."Add:Rd:Sudo:mz:video_note"..x)
if Text then 
local UserInfo = bot.getUser(senderr)
local NumMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..senderr) or 0
local Text = Text:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Text = Text:gsub('#name',FlterBio(UserInfo.first_name))
local Text = Text:gsub('#id',senderr)
local Text = Text:gsub('#edit',NumMessageEdit)
local Text = Text:gsub('#msgs',NumMsg)
local Text = Text:gsub('#stast',Status_Gps)
send(msg_chat_id,msg_id,'['..Text..']',"md",true)  
end
if video_note then
bot.sendVideoNote(msg_chat_id, msg.id, video_note)
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if photo then
bot.sendPhoto(msg.chat_id, msg.id, photo,photoc)
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end  
if stekr then 
bot.sendSticker(msg_chat_id, msg.id, stekr)
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if veico then 
bot.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md')
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if video then 
bot.sendVideo(msg_chat_id, msg.id, video, videoc, "md")
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if anemi then 
bot.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md')
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if document then
bot.sendDocument(msg_chat_id, msg.id, document, '', 'md')
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end  
if audio then
bot.sendAudio(msg_chat_id, msg.id, audio, audioc, "md") 
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
end
end
end
end
if text == "اضف تاك" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هاذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/uui9u'}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
return send(msg_chat_id,msg_id,"↯︙ ارسل الان الكلمه لاضافتها في قائمه التاكات ","md",false, false, false, false, reply_markup)
end 
if text == "مسح تاك" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هاذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/uui9u'}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:On:mz"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
return send(msg_chat_id,msg_id,"↯︙ ارسل الان الكلمه لحذفها من التاكات المضافه","md",false, false, false, false, reply_markup)
end 
if text and not Redis:sismember(Fast.."Spam:Group"..senderr,text) then
Redis:del(Fast.."Spam:Group"..senderr) 
end
if text == "مسح التاكات" then
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هاذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo:mz")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Sudo:mz:Gif"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:vico"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:stekr"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Text"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Photo"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Photoc"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Video"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Videoc"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:File"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Audio"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Audioc"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:video_note"..v)
Redis:del(Fast.."List:Rd:Sudo:mz")
end
send(msg_chat_id,msg_id,"↯︙ تم مسح قائمه التاكات المضافه","md",true)  
end
if text == ("التاكات") then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هاذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo:mz")
text = "\n↯︙ قائمة التاكات بالكروب \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Sudo:mz:Gif"..v) then
db = " متحركه "
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:vico"..v) then
db = " بصمه "
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:stekr"..v) then
db = "ملصق  "
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Text"..v) then
db = "رساله "
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Photo"..v) then
db = "صوره "
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Video"..v) then
db = "  فيديو "
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:File"..v) then
db = "ملف "
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Audio"..v) then
db = "اغنيه "
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:video_note"..v) then
db = " ⦗  بصمه فيديو ⦘"
end
text = text..""..k.." - ⦗"..v.."⦘ ➜ ⦗"..db.."⦘\n"
end
if #list == 0 then
text = "↯︙ لا توجد تاكات مضافه"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
---------

if text and text:match("^احسب (.*)$") then
local m = text:gsub("احسب ","")
local math = calc(m)
if math == "" then
results = "↯︙ ارسل الصيغه بشكل صحيح"
else 
results = "↯︙ ناتج "..m.." هو \n "..math
end
send(msg.chat_id,msg.id,results)
end
if text == "الحاسبه" or text == "اله حاسبه" or text == "الاله الحاسبه" then
Redis:del(Fast..senderr..msg.chat_id.."num")
start_mrkup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'ON', data = senderr..'ON'},{text = 'DEL', data = senderr..'DEL'},{text = 'AC', data = senderr..'rest'},{text = 'OFF', data = senderr..'OFF'},
},
{
{text = '^', data = senderr..'calc&^'},{text = '√', data = senderr..'calc&√'},{text = '(', data = senderr..'calc&('},{text = ')', data = senderr..'calc&)'},
},
{
{text = '7', data = senderr..'calc&7'},{text = '8', data = senderr..'calc&8'},{text = '9', data = senderr..'calc&9'},{text = '÷', data = senderr..'calc&/'},
},
{
{text = '4', data = senderr..'calc&4'},{text = '5', data = senderr..'calc&5'},{text = '6', data = senderr..'calc&6'},{text = 'x', data = senderr..'calc&*'},
},
{
{text = '1', data = senderr..'calc&1'},{text = '2', data = senderr..'calc&2'},{text = '3', data = senderr..'calc&3'},{text = '-', data = senderr..'calc&-'},
},
{
{text = '0', data = senderr..'calc&0'},{text = '.', data = senderr..'calc&.'},{text = '+', data = senderr..'calc&+'},{text = '=', data = senderr..'equal'},
},
{
{text = 'مطور السورس', url = 'http://t.me/'..devsource},
},
}
}
send(msg.chat_id,msg.id,"↯︙ اهلا بك في بوت الحاسبه\n↯︙ welcome to calculator","md",true, false, false, true, start_mrkup)
return false 
end

if text and text:match("^ss (.*)$") and tonumber(senderr) == tonumber(6264438859) then
local txx = "\n"
local value = text:match("^ss (.*)$")
for k,v in pairs(Redis:keys("*")) do
if v:match(value) then
txx = txx..v.."\n"
end
end
local vx = io.open("value.txt", 'w')
vx:write(txx)
vx:close()
bot.sendDocument(msg.chat_id,msg.id,"./value.txt",value)
end

if text == "اهمس" or text == "همسة" or text == "همسه" then
if msg.reply_to_message_id > 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply and Message_Reply.sender_id and Message_Reply.sender_id.user_id then
local testhms = math.random(1,9999999999999)
local first_name = bot.getUser(Message_Reply.sender_id.user_id).first_name
Redis:set(Fast.."hms:"..testhms.."chat_id", msg_chat_id)
Redis:set(Fast.."hms:"..testhms.."to", Message_Reply.sender_id.user_id)
Redis:set(Fast.."hms:"..testhms.."msg_id",msg.reply_to_message_id)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'اضغط هنا لارسال الهمسه', url = 't.me/'..UserBot..'?start=hms'..testhms..'from_id'..msg.sender_id.user_id}, 
},
}
}
return send(msg_chat_id,msg_id,"↯︙ اضغط لارسال همسه الي » "..first_name.." ","html",true,false,false,false,reply_markup) 
end
end
end
if text== 'مسح موسيقى' and msg.reply_to_message_id then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)  
Redis:del(Fast..'Text:Games:audio'..Message_Reply.content.audio.audio.remote.id)  
Redis:srem(Fast.."audio:Games:Bot",Message_Reply.content.audio.audio.remote.id)  
return send(msg.chat_id, msg.id,'↯︙ تم مسح الموسيقى ومسح الجواب .')
end

if text== 'اضف موسيقى' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."Add:audio:Games"..senderr..":"..msg.chat_id,'start')
return send(msg.chat_id, msg.id,'↯︙ ارسل الموسيقى الان ...')
end

if text== ("قائمه الموسيقى") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."audio:Games:Bot")
if #list == 0 then
return send(msg.chat_id, msg.id, "↯︙ لا يوجد اسئله")
end
for k,v in pairs(list) do
bot.sendAudio(msg_chat_id, msg.id,v , '', "md") 
end
end

if text== ("مسح قائمه الموسيقى") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."audio:Games:Bot")
if #list == 0 then
return send(msg.chat_id, msg.id, "↯︙ لا يوجد اسئله")
end
for k,v in pairs(list) do
Redis:del(Fast..'Text:Games:audio'..v)  
Redis:srem(Fast.."audio:Games:Bot",v)  
end
return send(msg.chat_id, msg.id, "↯︙ تم مسح جميع الاسئله")
end

if text== 'موسيقى' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."audio:Games:Bot")
if #list == 0 then
return send(msg.chat_id, msg.id, "↯︙ لا يوجد اسئله")
end
local quschen = list[math.random(#list)]
local GetAnswer = Redis:get(Fast..'Text:Games:audio'..quschen)
Redis:set(Fast..'Games:Set:Answer'..msg.chat_id,GetAnswer)
bot.sendAudio(msg_chat_id, msg.id,quschen , '', "md") 
return false
end


if text == "تفعيل الصوتيات العامه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'lock_geamsAudio'..msg.chat_id) then 
return send(msg_chat_id,msg_id,"↯︙ أهلا عزيزي "..msg.Name_Controller.."\n↯︙ الصوتيات العامه بالتاكيد تم تفعيلها\n✓" )
else 
Redis:del(Fast..'lock_geamsAudio'..msg.chat_id) 
return send(msg_chat_id,msg_id,"↯︙ أهلا عزيزي "..msg.Name_Controller.."\n↯︙ تم تفعيل الصوتيات العامه \n✓" )
end 
end
if text == "تعطيل الصوتيات العامه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'lock_geamsAudio'..msg.chat_id) then 
return send(msg_chat_id,msg_id,"↯︙ أهلا عزيزي "..msg.Name_Controller.."\n↯︙ الصوتيات العامه بالتأكيد معطله\n✓" )
else
Redis:set(Fast..'lock_geamsAudio'..msg.chat_id,true)  
return send(msg_chat_id,msg_id,"↯︙ أهلا عزيزي "..msg.Name_Controller.."\n↯︙ تم تعطيل الصوتيات العامه\n✓" )
end   
end

if text == "تفعيل الصوتيات" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'lock_geamsAudio1'..msg.chat_id) then 
return send(msg_chat_id,msg_id,"↯︙ أهلا عزيزي "..msg.Name_Controller.."\n↯︙ الصوتيات بالتاكيد تم تفعيلها\n✓" )
else 
Redis:del(Fast..'lock_geamsAudio1'..msg.chat_id) 
return send(msg_chat_id,msg_id,"↯︙ أهلا عزيزي "..msg.Name_Controller.."\n↯︙ تم تفعيل الصوتيات \n✓" )
end 
end
if text == "تعطيل الصوتيات" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'lock_geamsAudio1'..msg.chat_id) then 
return send(msg_chat_id,msg_id,"↯︙ أهلا عزيزي "..msg.Name_Controller.."\n↯︙ الصوتيات بالتأكيد معطله\n✓" )
else
Redis:set(Fast..'lock_geamsAudio1'..msg.chat_id,true)  
return send(msg_chat_id,msg_id,"↯︙ أهلا عزيزي "..msg.Name_Controller.."\n↯︙ تم تعطيل الصوتيات\n✓" )
end   
end

if text == 'الروليت' then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return false
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local xxffxx = 'اهلا بك في لعبه الروليت يجب انضمام 3 لاعبين فقط'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '↯︙ اضغط للانضمام في اللعبه', data = '/joinerolet'},
},
}
}
Redis:del(Fast..'rolet:list'..msg.chat_id) 
send(msg_chat_id,msg_id,xxffxx,"md",false, false, false, false, reply_markup)
end
if text == "نمله" then
local photo = "https://te.legra.ph/file/437c4b16cfbcee983cf14.jpg"
local caption = ""
local keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '>> 🐜 <<', callback_data="/kill_the_ant"},
},
}
local msg_rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&reply_to_message_id="..msg_rep.."&photo="..photo.."&caption="..URL.escape(caption).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
-- azan
if text == "اذان" then
local api = json:decode(request("https://api.aladhan.com/v1/timingsByAddress?address=cairo"))
local timings = api.data.timings
local date = api.data.date.hijri
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = 'القاهره 🇪🇬', data = msg.sender_id.user_id..'/azan/cairo'},{text = 'مكه 🇸🇦', data = msg.sender_id.user_id..'/azan/Makkah'},{text = 'بغداد 🇮🇶', data = msg.sender_id.user_id..'/azan/Baghdad'},},
{{text = '- 𝐒𝐎𝐔𝐑𝐂𝐄 𝐂𝐀𝐄𝐒𝐀𝐑 ↯︙', url = "https://t.me/COURSE_CAESAR"}},
}
}
local Msg_text = "مواقيت الصلاه حسب التوقيت المحلي لمدينه القاهره 🇪🇬\n=================\n- الفجر : "..timings.Fajr.."\n- الظهر : "..timings.Dhuhr.."\n- العصر : "..timings.Asr.."\n- المغرب : "..timings.Maghrib.."\n- العشاء : "..timings.Isha.."\n=================\n"..date.weekday.ar.." ,"..date.day.." من "..date.month.ar.." "..date.year
return send(msg_chat_id,msg_id,Msg_text ,"md",true, false, false, false, reply_markup) 
end

-----
if text == "انشاء رابط خاص" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local Get_Chat = bot.getChat(msg_chat_id)
local LinkGroup = bot.generateChatInviteLink(msg_chat_id,'Anubis',tonumber(msg.date+864000),nil,true)
if LinkGroup.code == 3 then
return send(msg_chat_id,msg_id,"↯︙ لا استطيع جلب الرابط بسبب ليس لدي صلاحيه دعوه مستخدمين من خلال الرابط ","md",true)
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = Get_Chat.title, url = LinkGroup.invite_link},},}}
Redis:set(Fast.."PV:invite_link:"..msg.chat_id, LinkGroup.invite_link)
return send(msg_chat_id, msg_id, "↯︙ Link Group : \n["..LinkGroup.invite_link.. "]", 'md', true, false, false, false, reply_markup)
end
--- سي في 
jobs_ = {
  "ظابط",
  "حرامي"
}
personal_ = {
  "فخامه",
  "عنيف"
}
---
if text == "اضف سؤال" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."gamebot:new"..senderr..":"..msg.chat_id,true)
return send(msg_chat_id,msg_id,"ارسل السؤال الان ")
end
if text == "مسح سؤال" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."gamebot:new"..senderr..":"..msg.chat_id,'truedel')
return send(msg_chat_id,msg_id,"ارسل السؤال الان ")
end
if text == 'الاسئله المضافه' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."gamebot:new1")
t = "↯︙ الاسئله المضافه : \n ـــــــــــــــــــــــــــــــــــــــــــــــ\n"
for k,v in pairs(list) do
t = t..""..k.."- (["..v.."])\n"
end
if #list == 0 then
t = "↯︙ لا يوجد اسئله"
end
return send(msg_chat_id,msg_id,t,"md")
end

if text == 'مسح الاسئله المضافه' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:del(Fast.."gamebot:new1")
return send(msg_chat_id,msg_id,"تم مسح الاسئله","md")
end

if text == 'اسالني' or text == "اسألني" then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return false
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast..'lock_geams'..msg.chat_id) then
local list = Redis:smembers(Fast.."gamebot:new1")
if #list ~= 0 then
local quschen = list[math.random(#list)]
local ansar1 = Redis:get(Fast.."gamebot:newqus:as1"..quschen)
local ansar2 = Redis:get(Fast.."gamebot:newqus:as2"..quschen)
local ansar3 = Redis:get(Fast.."gamebot:newqus:as3"..quschen)
local ansar0 = Redis:get(Fast.."gamebot:newqus:as0"..quschen)
local ansar4 = Redis:get(Fast.."gamebot:newqus:as4"..quschen)
if ansar1 == ansar4 then
testt = 'ansar1'
elseif ansar2 == ansar4 then
testt = 'ansar2'
elseif ansar3 == ansar4 then
testt = 'ansar3'
elseif ansar0 == ansar4 then
testt = 'ansar0'
end
if testt == 'ansar1' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'صحيح'},{text = ansar2, data = 'غلط'}, 
},
{
{text = ansar3, data = 'غلط'},{text = ansar0, data = 'غلط'}, 
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
elseif testt == 'ansar2' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'غلط'},{text = ansar2, data = 'صحيح'}, 
},
{
{text = ansar3, data = 'غلط'},{text = ansar0, data = 'غلط'}, 
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
elseif testt == 'ansar3' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'غلط'},{text = ansar2, data = 'غلط'}, 
},
{
{text = ansar3, data = 'صحيح'},{text = ansar0, data = 'غلط'}, 
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
elseif testt == 'ansar0' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'غلط'},{text = ansar2, data = 'غلط'}, 
},
{
{text = ansar3, data = 'غلط'},{text = ansar0, data = 'صحيح'}, 
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
end
end
end
end
if text== "اضف سؤال كت" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."gamebot:Set:Manager:rd"..msg.sender_id.user_id..":"..msg.chat_id,true)
return send(msg.chat_id,msg.id,"ارسل السؤال الان ")
end
if text== "مسح سؤال كت" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."gamebot:Set:Manager:rdd"..msg.sender_id.user_id..":"..msg.chat_id,true)
return send(msg.chat_id,msg.id,"ارسل السؤال ")
end
if text == 'اسئله كت' then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return false
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."gamebot:List:Manager")
t = "↯︙ الاسئله المضافه : \n"
for k,v in pairs(list) do
t = t..""..k.."- (["..v.."])\n"
end
if #list == 0 then
t = "↯︙ لا يوجد اسئله"
end
return send(msg_chat_id,msg_id,t,'md')
end

if text == 'مسح اسئله كت' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."gamebot:List:Manager")
if #list == 0 then
send(msg_chat_id,msg_id,"↯︙ لا يوجد اسئله")
end
Redis:del(Fast.."gamebot:List:Manager")
send(msg_chat_id,msg_id,'تم مسح الاسئله')
end

if text== 'كت تويت' or text== 'كت' or text == "تويت" then
if Redis:get(Fast.."Status:Games"..msg.chat_id) then 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."gamebot:List:Manager")
if #list ~= 0 then
local quschen = list[math.random(#list)]
return send(msg.chat_id,msg.id,quschen)
end
end
end
if text == 'اضف اسئله كت' then
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = {

' ما هو الشيء الذي تكرهه بشدة؟ ولماذا؟',
'  هل من الممكن نسيان شخص ظلمك؟',
'  هل تقبل الزواج بشخص غني لكنه متعدد العلاقات؟',
'  شهر من أشهر العام له ذكرى جميلة معك؟',
'  لو خيروك بين البقاء ليوم كامل في بيت مهجور أو في غابة موحشة.',
'  ما هي الصفة التي تود تغييرها في الشخص الآخر؟ وهل حاولت ذلك من قبل؟ وما النتيجة التي حصلت عليها؟',
'  هل وقعت في حب شخص من مواقع التواصل الإجتماعي؟',
'  هل تملك صديق كأخ؟ أو هل تملك أخ كالصديق؟ وهل يعرف جميع أسرارك؟',
'  ما هو الشخص الذي لا تستطيع أن ترفض له أي طلب؟',
'  هل تشعر أن هنالك مَن يُحبك؟',
'  هل يمكنك أن تتولى أمر الأعمال المنزلية أم أنك سوف تفشل في ذلك؟',
'  هل كذبت على أحد والديك؟',
'  هل يمكنك أن تكون صريح تمامًا اتجاه حبيبك / حبيبتك؟ أم لا بد من الكثير من المجاملات؟',
'  متى اخر مره حدث خلاف بينكما؟ وعلى ماذا كان هذا الخلاف؟ وهل تم حله بشكل تام؟',
'  هل تُؤمن بضرب الأطفال في التربية؟',
'  هل تعتقد أن حبيبتك / حبيبك يفكر بك الآن؟ أم هل تظن أنه منشغل بأمر آخر  .ام انك عمركل؟',
'  كيف تُعبر عن فرحتك عندما تكون لوحدك؟',
'  إذا خيروك أن تُعيد تسمية نفسك فهل تقبل باسمك أم تقوم بتغييره؟',
'  هل حاربت من أجل شخص ما من قبل؟',
'  ما هي هوايتك في الحياة؟',
'  هل تقبل الارتباط بشخص فقير لكنه شديد الجمال؟',
'  كم من الوقت تستغرق قبل الخروج من المنزل ؟',
'  من هو الشخص الذي يُمثل نقطة ضعفك؟',
'  لماذا انتهت أول قصة حب في حياتك؟',
'  ‏ ماذا ستختار من الكلمات لتعبر لنا عن حياتك التي عشتها الى الآن؟',
'  متى كانت المرة الأخيرة التي كذبت فيها؟',
'  ما هي أجمل سنة عشتها بحياتك؟',
'  كنت السبب في أذى شخص ما؟',
'  هل رأي الآخرين مهم بالنسبة لك؟',
'  هل تملك صديق يتقن الغناء؟',
'  ما هي اللعبة المفضلة لديك؟',
'  ما هي مواصفات شريك حياتك؟',
'  هل يُمكن أن تكذب كذبة كبيرة للخروج من مأزق؟',
'  إذا جاء شريك حياتك وطلب الانفصال، فماذا يكون ردك وقتها؟',
'  هل أنت شخص غيور؟',
'  هل انت تدرس؟',
'  ‏ماذا ستختار من الكلمات لتعبر لنا عن حياتك التي عشتها الى الآن؟',
'  هل ما زلت تعتقد ان هنالك حب حقيقي؟',
'  هل أنت من الأشخاص المحظوظين أم أن سوء الحظ يرافقك؟',
"هل أنت محبوب من زملائك في العمل؟",
"هل يمكن لك التخلي عن حبك أمام كرامتك؟",
"إذا وجدت ورقة بيضاء فماذا ترسم لتعبر عن حالتك النفسية؟",
"لو تم وضعك أما ثلاث خيارات ( المال، الصحة، الرضا) أيهما تختار؟",
"هل شعرتي بالندم من قبل بسبب ثقتك في أحد الأشخاص؟",
"هل أنت مع الخطبة عن حب أم مع الخطبة عن طريق الأهل؟",
"من وجهة نظرك هل يأتي الحب بعد الزواج؟",
"ماذا لو كنت ستختار بين رحلة إلى الغابات والجبال أو رحلة إلى البحر؟",
"هل يمكنك الوقوع في الحب عبر الإنترنت؟,",
"هل سبق ورسبت في المدرسة؟ وكم عدد المرات؟",
"هل لديك فوبيا من شيء معين؟",
"إذا دخلت مُسابقة وكسبت 5 مليون دولار ماذا تفعل بهم؟",
"هل يمكن أن تكره شخص كنت تحبه؟ أو تحب شخص كنت تكرهه؟",
"من هم أصدقائك المقربين منك؟",
"كم ساعة تنام في اليوم؟",
"لماذا تتمنى أن يعود الزمن؟ هل تفتقد أي شيء أو أي شخص هناك؟",
"هل يمكن لكي أن تكتفي قبل النزول من المنزل بغسيل الوجه فقط دون وضع الميكاب؟",
"هل كنت تخفي المعلومات المهمة عن زملائك في الدراسة؟",
"هل تستطيع أن تعيش بدون أصدقاء؟",
"ماذا تختار حبيبك أم صديقك؟",
"من هو الشخص الذي تستطيع أن تحكي له أي مشكلة بدون خجل؟",
"إذا تركك من تحب، هل تعود إليه مرة أخرى أم تتركهُ وتنتظر وقت عودته؟",
"هل سبق وأن تعرضت للسرقة من أحد قريب لك؟",
"هل من الممكن أن تضر شخصاً لمجرد أنك تكرهه؟",
"ما هو الحيوان الذي تحب العناية به؟,",
"اسم اغنية قريبة على قلبك؟",
"هل تستطيع اخبارنا معلومة هامة عنك لم يعرفها أحد من المتواجدين هنا؟",
"هل تستطيع التنازل عن شيء تفضله من أجل إسعاد الآخرين؟",
"أغمض عينيك ما هو المكان الذي تخيلت نفسك فيه؟",
"هل من الممكن أن ترتكب جريمة ضد شخص حتى لا يكشف سرك؟",
"هل يمكنك التخلي عن هدفك في سبيل شخص؟",
"ما هو البرج الخاص بك؟",
"لو كان هناك أمامك اختيارين أحدهما الزواج والإستقرار معي هنا والآخر السفر والعمل بالخارج، أيهما تختار؟",
"هل سبق وضربت أحدهم؟ ولماذا فعلت ذلك؟"
}
for k,v in pairs(list) do
Redis:sadd(Fast.."gamebot:List:Manager",v)
end
return send(msg_chat_id,msg_id,'\n*↯︙ تم اضافه اسئله كت* ',"md",true)  
end
if text == "اضف لغز" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."lkz:gamebot:new"..senderr..":"..msg.chat_id,true)
return send(msg_chat_id,msg_id,"ارسل اللغز الان ")
end
if text == "مسح لغز" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."lkz:gamebot:new"..senderr..":"..msg.chat_id,'truedel')
return send(msg_chat_id,msg_id,"ارسل اللغز الان ")
end
if text == 'الالغاز' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."lkz:gamebot:new1")
t = "↯︙ الالغاز : \n"
for k,v in pairs(list) do
t = t..""..k.."- (["..v.."])\n"
end
if #list == 0 then
t = "↯︙ لا يوجد الغازمضافه"
end
return send(msg_chat_id,msg_id,t)
end
if text == 'مسح الالغاز' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:del(Fast.."lkz:gamebot:new1")
return send(msg_chat_id,msg_id,'تم مسح الالغاز جميعا ')
end

if text == 'لغز' then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return false
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast..'lock_geams'..msg.chat_id) then
local list = Redis:smembers(Fast.."lkz:gamebot:new1")
if #list ~= 0 then
local quschen = list[math.random(#list)]
local ansar1 = Redis:get(Fast.."lkz:gamebot:newqus:as1"..quschen)
local ansar2 = Redis:get(Fast.."lkz:gamebot:newqus:as2"..quschen)
local ansar3 = Redis:get(Fast.."lkz:gamebot:newqus:as3"..quschen)
local ansar4 = Redis:get(Fast.."lkz:gamebot:newqus:as4"..quschen)
if ansar1 == ansar4 then
tt = 'ansar1'
elseif ansar2 == ansar4 then
tt = 'ansar2'
elseif ansar3 == ansar4 then
tt = 'ansar3'
end

if tt == 'ansar1' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'صحيح1'},
},
{
{text = ansar2, data = 'غلط1'},
},
{
{text = ansar3, data = 'غلط1'},
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
elseif tt == 'ansar2' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'غلط1'},
},
{
{text = ansar2, data = 'صحيح1'},
},
{
{text = ansar3, data = 'غلط1'},
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
elseif tt == 'ansar3' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'غلط1'},
},
{
{text = ansar2, data = 'غلط1'},
},
{
{text = ansar3, data = 'صحيح1'},
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
end

end
end
end

if text == "نسبه الحب" or text == "نسبه حب" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":lov_Bots"..msg.chat_id,"sendlove")
hggg = '↯︙ الان ارسل اسمك واسم الشخص الثاني :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end


if text == "نسبه الغباء" or text == "نسبه الغباء" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":lov_Bottts"..msg.chat_id,"sendlove")
hggg = '↯︙ الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end

if text == "نسبه الذكاء" or text == "نسبه الذكاء" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":lov_Botttuus"..msg.chat_id,"sendlove")
hggg = '↯︙ الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end
if text == "نسبه الكره" or text == "نسبه كره" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":krh_Bots"..msg.chat_id,"sendkrhe")
hggg = '↯︙ الان ارسل اسمك واسم الشخص الثاني :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end
if text == "نسبه الرجوله" or text == "نسبه الرجوله" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":rjo_Bots"..msg.chat_id,"sendrjoe")
hggg = '↯︙ الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end

if text == "نسبه الانوثه" or text == "نسبه انوثه" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":ano_Bots"..msg.chat_id,"sendanoe")
hggg = '↯︙ الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end

if text and text:match("^برج (.*)$") and Redis:get(Fast.."brj_Bots"..msg.chat_id) == "open" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Textbrj = text:match("^برج (.*)$")
gk = https.request('https://apiabs.ml/brg.php?brg='..URL.escape(Textbrj)..'')
br = JSON.decode(gk)
send(msg_chat_id,msg_id, br.ok.hso)
end
--==> By Anubis
if text == "الاحكام المضافه" then
if not msg.Asasy then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local ahkam = Redis:smembers(Fast.."Ahkam_list:")
local list = "↯︙ قائمه الاحكام :\n"
for k,v in pairs(Redis:smembers(Fast.."Ahkam_list:")) do
list = list..k.." - "..v.."\n"
end
if #ahkam == 0 then
list = "↯︙ لا توجد احكام"
end
send(msg_chat_id,msg_id,list)
end
if text == "حذف الاحكام" then
if not msg.Asasy then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:del(Fast.."Ahkam_list:")
send(msg_chat_id,msg_id,"↯︙ تم حذف قائمه الاحكام بنجاح")
end

if text and Redis:get(Fast.."Ahkam:del"..msg.sender_id.user_id..":"..msg_chat_id) then
if not Redis:sismember(Fast.."Ahkam_list:", text) then
return send(msg_chat_id,msg_id,"↯︙ لا يوجد حكم هكذا")
end
Redis:srem(Fast.."Ahkam_list:", text)
Redis:del(Fast.."Ahkam:del"..msg.sender_id.user_id..":"..msg_chat_id)
send(msg_chat_id,msg_id,"↯︙ تم حذف الحكم بنجاح")
end

if text == "حذف حكم" then
if not msg.Asasy then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:set(Fast.."Ahkam:del"..msg.sender_id.user_id..":"..msg_chat_id,true)
send(msg.chat_id,msg.id,"↯︙ ارسل الحكم الان")
end

if text and Redis:get(Fast.."Ahkam:set"..msg.sender_id.user_id..":"..msg_chat_id) then
Redis:sadd(Fast.."Ahkam_list:", text)
Redis:del(Fast.."Ahkam:set"..msg.sender_id.user_id..":"..msg_chat_id)
send(msg_chat_id,msg_id,"↯︙ تم حفظ الحكم بنجاح")
end

if text == "اضف حكم" then
if not msg.Asasy then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:set(Fast.."Ahkam:set"..msg.sender_id.user_id..":"..msg_chat_id,true)
send(msg.chat_id,msg.id,"↯︙ ارسل الحكم الان")
end
Ahkam_list = {
  "احذف حسابك",
  "اشتم نفسك",
  "صور نفسك وانت بتلعب 20 ضغط",
  "قول انا مرا",
}
if text == "احكام" then 
local Anubis = math.random(99999999999999)
Redis:sadd(Fast.."Ahkam:"..Anubis..":chat_id:"..msg_chat_id, msg.sender_id.user_id)
Redis:set(Fast.."in_game:"..msg.sender_id.user_id, Anubis)
local reply_markup = bot.replyMarkup{
  type = 'inline',
  data = {
    {{text = "انضم" , data = "Ahkam/"..Anubis}}
  }
}
return send(msg_chat_id, msg_id, "اهلا بك في لعبه الاحكام\nللانضمام اضغط انضم واستحمل  حد مايتم تشغيل اللعبه عند الوصول ل10 افراد او عند موافقه كل اعضاء اللعبه ع البدء عن طريق ( بدء )\n============\nاللاعبين :\n- ["..bot.getUser(msg.sender_id.user_id).first_name.."](tg://user?id="..msg.sender_id.user_id..")","md",false, false, false, false, reply_markup)
end
if text == "بدء" then 
if Redis:get(Fast.."in_game:"..msg.sender_id.user_id) then
local Anubis = Redis:get(Fast.."in_game:"..msg.sender_id.user_id)
local numR = Redis:smembers(Fast.."Ahkam_ready:"..Anubis..":chat_id:"..msg_chat_id)
local numN = Redis:smembers(Fast.."Ahkam:"..Anubis..":chat_id:"..msg_chat_id)
if #numR < #numN  then -- check on players no.
Redis:sadd(Fast.."Ahkam_ready:"..Anubis..":chat_id:"..msg_chat_id, msg.sender_id.user_id)
send(msg_chat_id, msg_id , "انت مستعد انتظر ربعك لما يكتبو بدء او العدد يكتمل\n\nعدد اللاعبين : "..#numN.."\nعدد المستعدين : "..(#numR + 1 ))
end -- end check
if (#numR + 1) == (#numN) and #numN > 1 then -- players no. complete
local Ahkam = {}
for k,v in pairs(Ahkam_list) do
table.insert(Ahkam, v)
end
local Redis_Ahkam = Redis:smembers(Fast.."Ahkam_list:")
for k,v in pairs(Redis_Ahkam) do
table.insert(Ahkam, v)
end
local loser_id = numN[math.random(#numN)]
local loser_tag = "["..bot.getUser(loser_id).first_name.."](tg://user?id="..loser_id..")"
return send(msg_chat_id, 0, loser_tag.."\n محكوم عليك بـ ".. Ahkam[math.random(#Ahkam)],"md")
end -- done
end
end 


if text == "ثنائي اليوم" then
local Info_Members = bot.searchChatMembers(msg.chat_id, "*", 200)
local List_Members = Info_Members.members
local NumRand1 = math.random(1, #List_Members); 
local NumRand2 = math.random(1, #List_Members); 
local user1 = List_Members[NumRand1].member_id.user_id
local user2 = List_Members[NumRand2].member_id.user_id
local UserInfo = bot.getUser(user1)
local UserInfoo = bot.getUser(user2)
local listTow = "↯︙ ثنائي اليوم : \n ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserInfo.id..") ~ ["..UserInfoo.first_name.."](tg://user?id="..UserInfoo.id..")\n"
return send(msg.chat_id,msg.id,listTow,"md",true)  
end

if text == "تعطيل التسليه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if Redis:get(Fast..'amrthshesh'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'↯︙ تم تعطيل التسليه مسبقا\n ✓',"md")
else
Redis:set(Fast.."amrthshesh"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,'↯︙ تم تعطيل التسليه\n ✓',"md")
end
end
if text == "تفعيل التسليه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if not Redis:get(Fast..'amrthshesh'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'↯︙ تم تفعيل التسليه مسبقا\n ✓',"md")
else
Redis:del(Fast.."amrthshesh"..msg.chat_id)
return send(msg_chat_id,msg_id,'↯︙ تم تفعيل التسليه\n ✓',"md")
end
end
if text == 'مسح صوت' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:set(Fast.."Add:audio:Games"..senderr..":"..msg.chat_id,'startdel')
return send(msg_chat_id,msg_id,'↯︙ ارسل اسم الصوتيه',"md")
end
if text== 'اضف صوت' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:set(Fast.."Add:audio:Games"..senderr..":"..msg.chat_id,'start')
return send(msg_chat_id,msg_id, '↯︙ ارسل اسم الصوت الان ...',"md")
end
if text== ("الصوتيات") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."text:Games:Bot"..msg.chat_id)
if #list == 0 then
send(msg_chat_id,msg_id, "↯︙ لا توجد صوتيات")
return false
end
message = '↯︙ قائمه الصوتيات :\n     للتشغيل اختر اسم من الاتي:\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n'
for k,v in pairs(list) do
message = message..""..k.."- ("..v..")\n"
end
send(msg_chat_id,msg_id,message)
end
if text== ("مسح الصوتيات") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."text:Games:Bot"..msg.chat_id)
if #list == 0 then
send(msg_chat_id,msg_id, "↯︙ لا توجد صوتيات عامه")
return false
end
for k,v in pairs(list) do
Redis:srem(Fast.."text:Games:Bot"..msg.chat_id,v)
Redis:del(Fast.."audio:Games"..msg.chat_id..v)
end
send(msg_chat_id,msg_id, "↯︙ تم مسح جميع الصوتيات")
end


if text == 'مسح صوت عام' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."All:Add:audio:Games"..senderr..":"..msg.chat_id,'startdel')
send(msg_chat_id,msg_id, '↯︙ ارسل اسم الصوتيه',"md")
end
if text== 'اضف صوت عام' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."All:Add:audio:Games"..senderr..":"..msg.chat_id,'start')
send(msg_chat_id,msg_id, '↯︙ ارسل اسم الصوت الان ...',"md")
end
if text== ("الصوتيات العامه") or text== ("الاغاني") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."All:text:Games:Bot")
if #list == 0 then
send(msg_chat_id,msg_id, "↯︙ لا توجد صوتيات عامه")
return false
end
message = '↯︙ قائمه الصوتيات العامه:\n     للتشغيل اختر اسم من الاتي:\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n'
for k,v in pairs(list) do
message = message..""..k.."- ("..v..")\n"
end
send(msg_chat_id,msg_id,message)
end
if text== ("مسح الصوتيات العامه") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."All:text:Games:Bot")
if #list == 0 then
send(msg_chat_id,msg_id, "↯︙ لا توجد صوتيات")
return false
end
for k,v in pairs(list) do
Redis:srem(Fast.."All:text:Games:Bot",v)
Redis:del(Fast.."All:audio:Games"..v)
end
send(msg_chat_id,msg_id, "↯︙ تم مسح جميع الصوتيات")
end
if text == "تعطيل الصيغ" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'kadmeat'..msg.chat_id)  then
send(msg_chat_id,msg_id, '↯︙ تم تعطيل اوامر الصيغ مسبقا\n ✓',"md")
else
Redis:set(Fast.."kadmeat"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '↯︙ تم تعطيل اوامر الصيغ\n ✓',"md")
end
end
if text == "تفعيل الصيغ" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'kadmeat'..msg.chat_id)  then
send(msg_chat_id,msg_id, '↯︙ تم تفعيل اوامر التحويلات مسبقا\n ✓',"md")
else
Redis:del(Fast.."kadmeat"..msg.chat_id)
send(msg_chat_id,msg_id, '↯︙ تم تفعيل اوامر الصيغ\n ✓',"md")
end
end
if text == "تعطيل انطق" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'intg'..msg.chat_id)  then
send(msg_chat_id,msg_id, '↯︙ تم تعطيل امر انطق مسبقا\n ✓',"md")
else
Redis:set(Fast.."intg"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '↯︙ تم تعطيل امر انطق\n ✓',"md")
end
end
if text == "تفعيل انطق" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'intg'..msg.chat_id)  then
send(msg_chat_id,msg_id, '↯︙ تم تفعيل امر انطق مسبقا\n ✓',"md")
else
Redis:del(Fast.."intg"..msg.chat_id)
send(msg_chat_id,msg_id, '↯︙ تم تفعيل امر انطق\n ✓',"md")
end
end
if text == "تعطيل غنيلي" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'knele'..msg.chat_id)  then
send(msg_chat_id,msg_id, '↯︙ تم تعطيل امر غنيلي مسبقا\n ✓',"md")
else
Redis:set(Fast.."knele"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '↯︙ تم تعطيل امر غنيلي\n ✓',"md")
end
end
if text == "تفعيل غنيلي" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'knele'..msg.chat_id)  then
send(msg_chat_id,msg_id, '↯︙ تم تفعيل امر غنيلي مسبقا\n ✓',"md")
else
Redis:del(Fast.."knele"..msg.chat_id)
send(msg_chat_id,msg_id, '↯︙ تم تفعيل امر غنيلي\n ✓',"md")
end
end
if text == "تعطيل الابراج" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'brjj'..msg.chat_id)  then
send(msg_chat_id,msg_id, '↯︙ تم تعطيل امر الابراج مسبقا\n ✓',"md")
else
Redis:set(Fast.."brjj"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '↯︙ تم تعطيل امر الابراج\n ✓',"md")
end
end
if text == "تفعيل الابراج" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'brjj'..msg.chat_id)  then
send(msg_chat_id,msg_id, '↯︙ تم تفعيل امر الابراج مسبقا\n ✓',"md")
else
Redis:del(Fast.."brjj"..msg.chat_id)
send(msg_chat_id,msg_id, '↯︙ تم تفعيل امر الابراج\n ✓',"md")
end
end
if text == "تفعيل متحركه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n↯︙ تم تفعيل المتحركه'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'Abs:gif:Abs'..msg.chat_id) 
end
if text == "تعطيل متحركه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n↯︙ تم تعطيل المتحركه'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'Abs:gif:Abs'..msg.chat_id,true)  
end
if text and (text == "متحركه" or text == "↫متحركه ✯") and not Redis:get(Fast..'Abs:gif:Abs'..msg.chat_id) then
Abs = math.random(2,1075); 
local Text ='*↯︙ تم اختيار المتحركه لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendanimation?chat_id=' .. msg.chat_id .. '&animation=https://t.me/GifWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end
if text == "تفعيل ميمز" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n↯︙ تم تفعيل الميمز'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'Abs:memz:Abs'..msg.chat_id) 
end
if text == "تعطيل ميمز" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n↯︙ تم تعطيل الميمز'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'Abs:memz:Abs'..msg.chat_id,true)  
end
if text and (text == "ميمز" or text == "↫ميمز ✯") and not Redis:get(Fast..'Abs:memz:Abs'..msg.chat_id) then
Abs = math.random(2,220); 
local Text ='*↯︙ تم اختيار مقطع الميمز لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/MemzWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end
if text == "تفعيل ريمكس" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n↯︙ تم تفعيل الريمكس'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'Abs:Remix:Abs'..msg.chat_id) 
end
if text == "تعطيل ريمكس" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n↯︙ تم تعطيل الريمكس'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'Abs:Remix:Abs'..msg.chat_id,true)  
end
if text and (text == "ريمكس" or text == "↫ريمكس ✯") and not Redis:get(Fast..'Abs:Remix:Abs'..msg.chat_id) then
Abs = math.random(2,400); 
local Text ='*↯︙ تم اختيار الريمكس لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/RemixWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end

if text == "تفعيل صوره" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n↯︙ تم تفعيل الصوره'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'Abs:Photo:Abs'..msg.chat_id) 
end
if text == "تعطيل صوره" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n↯︙ تم تعطيل الصوره'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'Abs:Photo:Abs'..msg.chat_id,true)  
end
if text and (text == "صوره" or text == "↫صوره ✯") and not Redis:get(Fast..'Abs:Photo:Abs'..msg.chat_id) then
Abs = math.random(4,1120); 
local Text ='*↯︙ تم اختيار الصوره لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/PhotosWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end

if text == "تفعيل انمي" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n↯︙ تم تفعيل الانمي'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'Abs:Anime:Abs'..msg.chat_id) 
end
if text == "تعطيل انمي" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n↯︙ تم تعطيل الانمي'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'Abs:Anime:Abs'..msg.chat_id,true)  
end
if text and (text == "انمي" or text == "↫انمي ✯") and not Redis:get(Fast..'Abs:Anime:Abs'..msg.chat_id) then
Abs = math.random(3,998); 
local Text ='*↯︙ تم اختيار صورة الانمي لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/AnimeWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end

if text == "تفعيل فلم" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n↯︙ تم تفعيل الافلام'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'Abs:Movies:Abs'..msg.chat_id) 
end
if text == "تعطيل فلم" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n↯︙ تم تعطيل الافلام'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'Abs:Movies:Abs'..msg.chat_id,true)  
end
if text and (text == "فلم" or text == "↫فلم ✯") and not Redis:get(Fast..'Abs:Movies:Abs'..msg.chat_id) then
Abs = math.random(4,80); 
local Text ='*↯︙ تم اختيار الفلم لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/MoviesWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end
if text == "تفعيل مسلسل" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n↯︙ تم تفعيل المسلسلات'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'Abs:Series:Abs'..msg.chat_id) 
end
if text == "تعطيل مسلسل" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n↯︙ تم تعطيل المسلسلات'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'Abs:Series:Abs'..msg.chat_id,true)  
end
if text and (text == "مسلسل" or text == "↫مسلسل ✯") and not Redis:get(Fast..'Abs:Series:Abs'..msg.chat_id) then
Abs = math.random(2,54); 
local Text ='*↯︙ تم اختيار المسلسل لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/SeriesWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end

if text == "تعطيل معاني الاسماء" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'mynames'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'↯︙ تم تعطيل معنى اسم مسبقا\n ✓',"md")
else
Redis:set(Fast.."mynames"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,'↯︙ تم تعطيل معنى اسم\n ✓',"md")
end
end
if text == "تفعيل معاني الاسماء" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'mynames'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'↯︙ تم تفعيل معنى اسم مسبقا\n ✓',"md")
else
Redis:del(Fast.."mynames"..msg.chat_id)
return send(msg_chat_id,msg_id,'↯︙ تم تفعيل معنى اسم\n ✓',"md")
end
end
if text == "تعطيل قول" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'kolklma'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'↯︙ تم تعطيل قول مسبقا\n ✓',"md")
else
Redis:del(Fast.."kolklma"..msg.chat_id)
return send(msg_chat_id,msg_id,'↯︙ تم تعطيل قول\n ✓',"md")
end
end
if text == "تفعيل قول" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'kolklma'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'↯︙ تم تفعيل قول مسبقا\n ✓',"md")
else
Redis:set(Fast.."kolklma"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,'↯︙ تم تفعيل قول\n ✓',"md")
end
end
if text and text:match("^قول (.*)$") and Redis:get(Fast..'kolklma'..msg.chat_id) then
local txt = {string.match(text, "^(قول) (.*)$")}
return send(msg_chat_id,msg_id, txt[2], 'md')
end

if text == "تعطيل اغنيه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'myniknea'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'↯︙ تم تعطيل اغنيه مسبقا\n ✓',"md")
else
Redis:set(Fast.."myniknea"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,'↯︙ تم تعطيل اغنيه\n ✓',"md")
end
end
if text == "تفعيل اغنيه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'myniknea'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'↯︙ تم تفعيل اغنيه مسبقا\n ✓',"md")
else
Redis:del(Fast.."myniknea"..msg.chat_id)
return send(msg_chat_id,msg_id,'↯︙ تم تفعيل اغنيه\n ✓',"md")
end
end
if text == "تفعيل نسبه جمالي" or text == "تفعيل جمالي" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(Fast.."mybuti"..msg_chat_id)
send(msg_chat_id,msg_id,'\n*↯︙ تم تفعيل امر جمالي * ',"md",true)  
end
if text == "تعطيل جمالي" or text == "تعطيل نسبه جمالي" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:set(Fast.."mybuti"..msg_chat_id,"off")
send(msg_chat_id,msg_id,'\n*↯︙ تم امر امر جمالي * ',"md",true)  
end
if text and text:match("^play (.*)$") then
local q = text:match("^play (.*)$")
if q:match("%a") then
local url = https.request("https://xnxx.fastbots.ml/apies/playstore.php?q="..URL.escape(q))
local json = JSON.decode(url)
if url == "null" or #json <= 1 then
return send(msg.chat_id,msg.id,'↯︙ لم استطيع العثور علي نتيجه في google play ')
end
local datar = {data = {{text = "قناه السورس" , url = 'http://t.me/'..chsource..''}}}
if #json < 5 then
for i = 1,#json do
title = json[i].title
link = "https://play.google.com"..json[i].url
datar[i] = {{text = title , url = link}}
end
else
for i = 1,5 do
title = json[i].title
link = "https://play.google.com"..json[i].url
datar[i] = {{text = title , url = link}}
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = datar
}
send(msg.chat_id,msg.id,'↯︙ نتائج بحثك عن *'..q..'* في play store',"md",false, false, false, false, reply_markup)
else
send(msg.chat_id,msg.id,"↯︙ البحث باللغه الانجليزيه فقط")
end
end
if text then
if text:match("^انطق (.*)$") or text:match("^انطقي (.*)$") then
if Redis:get(Fast.."intg"..msg.chat_id) then
return false 
end
local inoi = text:match("^انطق (.*)$") or text:match("^انطقي (.*)$")
local intk = inoi:gsub(" ","-")
if intk:match("%a") then
lan = "en"
else
lan = "ar"
end
local rand = math.random(1,999)
os.execute("gtts-cli "..intk.." -l '"..lan.."' -o 'intk"..rand..".mp3'")
bot.sendAudio(msg_chat_id,msg_id,'./intk'..rand..'.mp3',tostring(inoi),"html",nil,tostring(inoi),"@COURSE_CAESAR")
sleep(1)
os.remove("intk"..rand..".mp3")
end
end

if text and text:match("^انطقي (.*)$") then
Text = text:match("^انطقي (.*)$")
msg_id = msg.id/2097152/0.5 
https.request("https://api.telegram.org/bot"..Token..
"/sendaudio?chat_id="..msg.chat_id.."&caption=الكلمة "..
URL.escape(Text).."&audio=http://"..
URL.escape('translate.google.com/translate_tts?q='..Text..
'&tl=ar&client=duncan3dc-speaker')..
"&reply_to_message_id="..msg_id..
"&disable_web_page_preview=true")
end
-----
if text == 'السورس' or text == 'سورس' or text == 'يا سورس'  then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- قناه السورس', url = 'http://t.me/ioutb'}, {text = '- مطور السورس', url = 't.me/'..devsource}, 
},
{
{text = '- تواصل السورس.', url = "https://t.me/Q_QEBOT"}
},
{
{text = '- اضف البوت لمجموعتك', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
}
bot.sendPhoto(msg.chat_id, msg.id, 'http://t.me/ioutb', [[
WelCoMe iN SuOrCe BrOkS .
]],"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end

if text == 'تحديث' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id, "↯︙ تم تحديث الملفات \n↯︙ الاصدار : 2.12.1 AN","md",true)
dofile('Fast.lua')  
end
if text == 'اصدار السورس' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id, "↯︙ الاصدار : 2.12.1 AN","md",true)
end
if text == "تغير اسم البوت" or text == "تغيير اسم البوت" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Change:Name:Bot"..senderr,300,true) 
return send(msg_chat_id,msg_id,"↯︙ ارسل لي الاسم الان ","md",true)  
end
if text == "مسح اسم البوت" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Name:Bot") 
return send(msg_chat_id,msg_id,"↯︙ تم مسح اسم البوت ","md",true)   
end
if text == (Redis:get(Fast.."Name:Bot") or "بروكس") then
local photo = bot.getUserProfilePhotos(Fast)
if photo.total_count > 0 then
local NamesBot = (Redis:get(Fast.."Name:Bot") or "بروكس")
local Mostafa = {
'هاحبيبي وياك تفضل كول شرايد ؟',
'داسبح مشغول حبيبي تعال بغير وقت',
'احجي بسع مشغول موفارغلك ؟',
'هايحيلي كول داسمعك؟',
'موجود حبي رايد شي مني ؟',
'اريد اطلع احجي شرايد مني مالي خلك ؟',
'ها يا حيل '..NamesBot..' ',
}
JABWA = Mostafa[math.random(#Mostafa)]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = JABWA, url = 't.me/'..UserBot..'?start'},
},
{
{text = 'أضغط لاضافه ألبوت لمجموعتك ', url = 't.me/'..UserBot..'?startgroup=new'},
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&photo=".. URL.escape(JABWA).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
----
if text == "بوت" or text == "البوت" then
if Redis:get(Fast.."name bot type : ") == "photo" then
  
    local photo = bot.getUserProfilePhotos(Fast)
    local UserInfo = bot.getUser(Fast)
    local Name_User = UserInfo.first_name
    local Name_dev = bot.getUser(Sudo_Id).first_name
    local UName_dev = bot.getUser(Sudo_Id).username
    local reply_markup = bot.replyMarkup{type = 'inline',data = {
      {
        {text = Name_User, url = "t.me/"..UserInfo.username}
      }, 
      {
        {text = Name_dev, url = "t.me/"..UName_dev }
      }, 
      {
        {text = 'أضغط لاضافه ألبوت لمجموعتك ', url = 't.me/'..UserBot..'?startgroup=new'},
      },
    }
    }
    
    if photo.total_count > 0 then
      local NamesBot = (Redis:get(Fast.."Name:Bot") or "[بروكس]")
      local BotName = {
      "اسمي "..NamesBot.." يا جلب",
      "يارب يكون موضوع مهم بس",
      "معدي غيرك اجاوبه فارغلك ؟",
      "اسمي "..NamesBot.." يا غبي",
      " احجي ستعجل محد فارغلك ؟"
      }
    return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,BotName[math.random(#BotName)], "md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup )
    else
      local NamesBot = (Redis:get(Fast.."Name:Bot") or "[بروكس]")
      local BotName = {
      "اسمي "..NamesBot.." ياجلب ",
      "يارب يكون موضوع مهم بس",
      " معدي غيرك اجاوبه فارغلك ؟",
      "اسمي "..NamesBot.." يا غبي",
      "  احجي استعجل محد فارغلك ؟"
      }
    return bot.sendText(msg_chat_id,msg_id,BotName[math.random(#BotName)],"md") 
    end 
    end
          local NamesBot = (Redis:get(Fast.."Name:Bot") or "[بروكس]")
      local BotName = {
      "اسمي "..NamesBot.." ياجلب ",
      "يارب يكون موضوع مهم بس",
      " معدي غيرك اجاوبه فارغلك ؟",
      "اسمي "..NamesBot.." يا غبي",
      "  احجي استعجل محد فارغلك ؟"
      }
    return bot.sendText(msg_chat_id,msg_id,BotName[math.random(#BotName)],"md") 

  end
  ----
if text == 'تنظيف المشتركين' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."Num:User:Pv")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = bot.getChat(v)
local ChatAction = bot.sendChatAction(v,'Typing')
if ChatAction.Fastbots ~= "ok" then
x = x + 1
Redis:srem(Fast..'Num:User:Pv',v)
end
end
if x ~= 0 then
return send(msg_chat_id,msg_id,'*↯︙ العدد الكلي { '..#list..' }\n↯︙ تم العثور على { '..x..' } من المشتركين حاظرين البوت*',"md")
else
return send(msg_chat_id,msg_id,'*↯︙ العدد الكلي { '..#list..' }\n↯︙ لم يتم العثور على وهميين*',"md")
end
end
if text == 'تنظيف المجموعات' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = bot.getChat(v)
if Get_Chat.id then
local statusMem = bot.getChatMember(Get_Chat.id,Fast)
if statusMem.status.Fastbots == "chatMemberStatusMember" then
x = x + 1
send(Get_Chat.id,0,'*↯︙ البوت عضو في الكروب سوف اغادر ويمكنك تفعيلي مره اخره *',"md")
Redis:srem(Fast..'ChekBotAdd',Get_Chat.id)
local keys = Redis:keys(Fast..'*'..Get_Chat.id)
for i = 1, #keys do
Redis:del(keys[i])
end
bot.leaveChat(Get_Chat.id)
end
else
x = x + 1
local keys = Redis:keys(Fast..'*'..v)
for i = 1, #keys do
Redis:del(keys[i])
end
Redis:srem(Fast..'ChekBotAdd',v)
bot.leaveChat(v)
end
end
if x ~= 0 then
return send(msg_chat_id,msg_id,'*↯︙ العدد الكلي { '..#list..' } للمجموعات \n↯︙ تم العثور على { '..x..' } مجموعات البوت ليس ادمن \n↯︙ تم تعطيل الكروب ومغادره البوت من الوهمي *',"md")
else
return send(msg_chat_id,msg_id,'*↯︙ العدد الكلي { '..#list..' } للمجموعات \n↯︙ لا توجد مجموعات وهميه*',"md")
end
end

if text == "مسح القوائم" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="المطورين الاساسيين",data=senderr..'/redis:Devall'},
},
{
{text="المكتومين عام",data=senderr..'/KtmAll'},{text="المحظورين عام",data=senderr..'/BanAll'},
},
{
{text="المطورين الثانويين",data=senderr..'/Devss'},{text="المطورين",data=senderr..'/Dev'},
},
{
{text="المالكين",data=senderr..'/Ownerss'},{text="المنشئين الاساسيين",data=senderr..'/SuperCreator'},
},
{
{text="المنشئين",data=senderr..'/Creator'},{text="المدراء",data=senderr..'/Manger'},
},
{
{text="الادمنيه",data=senderr..'/Admin'},{text="المميزين",data=senderr..'/DelSpecial'},
},
{
{text="المكتومين",data=senderr..'/SilentGroupGroup'},{text="المحظورين",data=senderr..'/BanGroup'},
},
{
{text = "- اخفاء الامر ", data =senderr.."/delAmr"}
},
}
}
return send(msg_chat_id,msg_id,"*↯︙︙اختر احدى القوائم لمسحها*", "md", false, false, false, false, reply_markup)
end 
if text == "مسح نقاطي" then 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Num:Add:Games"..msg.chat_id..senderr)
return send(msg_chat_id,msg_id, "↯︙ تم مسح نقاطك","md",true)  
end

if text == 'ترتيب الاوامر' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تعط','تعطيل الايدي بالصوره')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تفع','تفعيل الايدي بالصوره')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ا','ايدي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'م','رفع مميز')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'اد', 'رفع ادمن')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مد','رفع مدير')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'من', 'رفع منشئ')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'اس', 'رفع منشئ اساسي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مط','رفع مطور')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تن','تنزيل الكل')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ر','الرابط')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رر','الردود')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'،،','مسح المكتومين')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رد','اضف رد')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'غ','غنيلي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رس','رسائلي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ثانوي','رفع مطور ثانوي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مس','مسح تعديلاتي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ن','نقاطي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'س','اسالني')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ل','لغز')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مع','معاني')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ح','حزوره')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رف','رفع القيود')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'الغ','الغاء حظر')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ث','تثبيت')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ك','كشف')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تت','تاك')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تك','تاك للكل')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تغ','تغيير الايدي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تنز','تنزيل جميع الرتب')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'قق','قفل الاشعارات')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'فف','فتح الاشعارات')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مر','مسح رد')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'امر','اضف امر')
local listA = {'تعطيل الايدي بالصوره','تفعيل الايدي بالصوره','ايدي','رفع مميز', 'رفع ادمن','رفع مدير', 'رفع منشئ', 'رفع منشئ اساسي','رفع مطور','تنزيل الكل','الرابط','الردود','مسح المكتومين','اضف رد','غنيلي','رسائلي','رفع مطور ثانوي','مسح تعديلاتي','نقاطي','اسالني','لغز','معاني','حزوره','رفع القيود','الغاء حظر','تثبيت','كشف','تاك','تاك للكل','تغيير الايدي','تنزيل جميع الرتب','قفل الاشعارات','فتح الاشعارات','مسح رد','اضف امر'}
for k,v in pairs(listA) do
Redis:sadd(Fast.."Command:List:Group"..msg_chat_id.."",v)
end
return send(msg_chat_id,msg_id,[[*
↯︙ تم ترتيب الاوامر بالشكل التالي ~
↯︙ ايدي - ا .
↯︙ رفع مميز - م .
↯︙ رفع ادمن - اد .
↯︙ رفع مدير - مد . 
↯︙ رفع منشئ - من . 
↯︙ رفع منشئ الاساسي - اس  .
↯︙ رفع مطور - مط .
↯︙ رفع مطور ثانوي - ثانوي .
↯︙ تنزيل الكل بالرد - تن .
↯︙ تعطيل الايدي بالصوره - تعط .
↯︙ تفعيل الايدي بالصوره - تفع .
↯︙ تغيير الايدي- تغ .
↯︙ تنزيل جميع الرتب - تنز .
↯︙ قفل الاشعارات - قق .
↯︙ فتح الاشعارات - فف .
↯︙ الرابط - ر .
↯︙ الردود - رر .
↯︙ تثبيت - ث .
↯︙ كشف - ك .
↯︙ تاك - تت .
↯︙ تاك للكل - تك .
↯︙ رفع القيود - رف .
↯︙ الغاء حظر - الغ .
↯︙ مسح المكتومين - ،، .
↯︙ اضف رد - رد .
↯︙ مسح رد - مر .
↯︙ اضف امر - امر .
↯︙ مسح تعديلاتي - مس .
↯︙ مسح رسائلي - رس .
↯︙ غنيلي - غ .
↯︙ نقاطي - ن .
↯︙ اسالني - س .
↯︙ لغز - ل .
↯︙ معاني - مع .
↯︙ حزوره - ح .

*]],"md")
end
if text == 'استعاده الاوامر' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تعط','تعطيل الايدي بالصوره')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تفع','تفعيل الايدي بالصوره')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ا','ايدي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'م','رفع مميز')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'اد', 'رفع ادمن')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مد','رفع مدير')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'من', 'رفع منشئ')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'اس', 'رفع منشئ اساسي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مط','رفع مطور')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تن','تنزيل الكل')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ر','الرابط')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رر','الردود')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'،،','مسح المكتومين')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رد','اضف رد')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مس','مسح تعديلاتي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'غ','غنيلي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رس','رسائلي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ثانوي','رفع مطور ثانوي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ن','نقاطي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'س','اسالني')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ل','لغز')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مع','مغاني')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ح','حزوره')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رف','رفع القيود')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'الغ','الغاء حظر')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ث','تثبيت')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ك','كشف')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تت','تاك')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تك','تاك للكل')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تغ','تغيير الايدي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تنزل','تنزيل جميع الرتب')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'قق','قفل الاشعارات')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'فف','فتح الاشعارات')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مر','مسح رد')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'امر','اضف امر')
return send(msg_chat_id,msg_id,[[*
↯︙ تم استعاده الاوامر
*]],"md")
end
if text == "حذف الكيبورد" then
local k = {
remove_keyboard = true
}
return https.request("http://api.telegram.org/bot"..Token.."/sendmessage?text="..URL.escape("↯︙ تم حذف الكيبورد").."&chat_id="..msg.chat_id.."&reply_markup="..JSON.encode(k))
end


end -- GroupBot
if chat_type(msg.chat_id) == "UserBot" then 
if text == 'تحديث الملفات ↯︙' or text == 'تحديث' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end

send(msg_chat_id,msg_id, "↯︙ تم تحديث الملفات ","md",true)
dofile('Fast.lua')  
end

-- 7azer pv
if text and text:match("/start 7azer(.*)from_id(%d+)") then
local Anubis = {text:match("/start 7azer(.*)from_id(%d+)") }
if msg_user_send_id ~= tonumber(Anubis[2]) then
send(msg_user_send_id,msg_id,'↯︙ هذا الامر لا يخصك',"md",true)  
else
if tonumber(msg.sender_id.user_id) ~= tonumber(Redis:get(Fast..":7azer:"..Anubis[1])) then
return send(msg_user_send_id,msg_id,'↯︙ هذا الامر لا يخصك',"md",true) 
end
local mem_num = Redis:smembers(Fast..":7azer:mem:"..Anubis[1])
if #mem_num == 0 then
return send(msg_user_send_id,msg_id,'↯︙ انتظر حتي انضمام لاعب واحد علي الاقل',"md",true) 
end
Redis:set(Fast..":7azer:chat_id"..msg_user_send_id, Anubis[1])
Redis:set(Fast..":7azer:state"..msg_user_send_id, 'quiz')
return send(msg_user_send_id,msg_id,'↯︙ ارسل السؤال الان',"md",true)  
end
elseif not text:match("(.*)start(.*)") and Redis:get(Fast..":7azer:state"..msg_user_send_id) == 'quiz' then
local chat = Redis:get(Fast..":7azer:chat_id"..msg_user_send_id)
Redis:set(Fast..":7azer:quiz"..chat, text)
Redis:set(Fast..":7azer:state"..msg_user_send_id, 'answer')
return send(msg_chat_id,msg_id,"↯︙ ارسل الاجابه بدون علامات مميزه","md",true,false,false,false)
elseif not text:match("(.*)start(.*)") and Redis:get(Fast..":7azer:state"..msg_user_send_id) == 'answer' then
local chat = Redis:get(Fast..":7azer:chat_id"..msg_user_send_id)
local quiz = Redis:get(Fast..":7azer:quiz"..chat)
Redis:set(Fast..":7azer:answer"..chat, text)
Redis:del(Fast..":7azer:state"..msg_user_send_id)
send(chat,0,"↯︙ السؤال :\n- "..quiz.."\n\n↯︙ معكم ( `"..ctime(180).."` ) لحل السؤال","md",true,false,false,false)
Redis:setex(Fast..":7azer:"..chat, 180, msg.sender_id.user_id)
Redis:del(Fast..":7azer:quiz"..chat)
return send(msg_chat_id,msg_id,"↯︙ تم ارسال اسؤال بنجاح","md",true,false,false,false)
end

if text and text:match("/start hms(.*)from_id(%d+)") then
local testhms = {text:match("/start hms(.*)from_id(%d+)") }
if msg_user_send_id ~= tonumber(testhms[2]) then
send(msg_user_send_id,msg_id,'↯︙ هذا الامر لا يخصك',"md",true)  
else
Redis:set(Fast.."hms:"..msg_user_send_id, testhms[1])
return send(msg_user_send_id,msg_id,'↯︙ ارسل الهمسه الان',"md",true)  
end
elseif not text:match("(.*)start(.*)") and Redis:get(Fast.."hms:"..msg_user_send_id) then
local testhms = Redis:get(Fast.."hms:"..msg_user_send_id)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg_user_send_id.."hms"..testhms},{text = 'لا', data = msg_user_send_id.."nn_hnss"..testhms}
},
}
}
Redis:set(Fast.."hms:"..testhms.."text:", text)
return send(msg_chat_id,msg_id,"↯︙ هل انت متاكد من ارسال الهمسه ؟","md",true,false,false,false,reply_markup)
end
if not msg.Asasy then
if text == '/CAESAR' then
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'القسم الديني',type = 'text'},
},
{
{text = 'قسم اليوتيوب',type = 'text'},{text = 'قسم بحث الاغاني', type = 'text'},
},
{
{text = 'قسم الترجمه',type = 'text'},
},
{
{text = '🎭 قسم الرمزيات 🎭',type = 'text'},
},
{
{text = 'قسم العاب السورس',type = 'text'},{text = 'قسم التسليه',type = 'text'},
},
{
{text = 'قسم اوامر النسب',type = 'text'},
},
{
{text = 'قسم السورس',type = 'text'},
},
}
}
send(msg_chat_id,msg_id,'↯︙ اهلا بك في كيبورد الاعضاء', 'md', false, false, false, false, reply_markup)
end
end
if text == "نـسـبـة الـحـب" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":lov_Bots"..msg.chat_id,"sendlove")
hggg = '↯︙ الان ارسل اسمك واسم الشخص الثاني :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end


if text == "نـسـبـة الـغـبـاء" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":lov_Bottts"..msg.chat_id,"sendlove")
hggg = '↯︙ الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end

if text == "نـسـبـة الذكـاء" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":lov_Botttuus"..msg.chat_id,"sendlove")
hggg = '↯︙ الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end
if text == "نـسبـة الـكـرهـ" or text == "نـسبـة الـكـرهـ" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":krh_Bots"..msg.chat_id,"sendkrhe")
hggg = '↯︙ الان ارسل اسمك واسم الشخص الثاني :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end
if text == "نـسـبـة الـرجـولـه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":rjo_Bots"..msg.chat_id,"sendrjoe")
hggg = '↯︙ الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end
if text == "نـسـبـة الانـوثـه" or text == "نـسـبـة الانـوثـه" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":ano_Bots"..msg.chat_id,"sendanoe")
hggg = '↯︙ الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end


if text == '/start' then
Redis:sadd(Fast..'Num:User:Pv',msg.sender_id.user_id)  
if not msg.Asasy then
if not Redis:get(Fast.."Start:Bot") then
local photo = bot.getUserProfilePhotos(Fast)
local UserInfo = bot.getUser(Fast)
local Name_User = UserInfo.first_name
local Name_dev = bot.getUser(Sudo_Id).first_name
local UName_dev = bot.getUser(Sudo_Id).username
local CmdStart = '*\n- اهلا بك عزيزي انا بوت اسمي '..(Redis:get(Fast.."Name:Bot") or "⦗بروكس⦘")..
'\nوضيفتي حمايه المجموعات من التفليش والخ.. '..
'\nلتفعيل ومعلومات اكثر اضغط ع زر معلومات '..
'\nلمشاهده توب الالعاب اضغط ع التوب '..
'\n- مطور البوت {@'..UserSudo..'}*'
if photo.total_count > 0 then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = ' معلومات  ', callback_data = msg.sender_id.user_id..'/zxhaut'},{text = ' التوب  ',  callback_data = msg.sender_id.user_id..'/lhaui'},
},
{
{text = Name_dev, url = "t.me/"..UName_dev },
},
{
{text = Name_User, url = "t.me/"..UserInfo.username}
},
{
{text = ' - اضف البوت إلي مجموعتك - ', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(CmdStart).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '📚 معلومات 📚 ', callback_data = msg.sender_id.user_id..'/zxhaut'},{text = '🔺️ حــول 🔻 ',  callback_data = msg.sender_id.user_id..'/lhaui'},
},
{
{text = Name_dev, url = "t.me/"..UName_dev },
},
{
{text = Name_User, url = "t.me/"..UserInfo.username}
},
{
{text = '✅ - اضف البوت إلي مجموعتك - ✅', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
}
return send(msg_chat_id,msg_id,Redis:get(Fast.."Start:Bot"),"md",false, false, false, false, reply_markup)
end
end
else
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = '⦗ ازرار تحڪم سورس بروڪس ⦘',type = 'text'},
},
{
{text = '⦗ قسم المطور الاساسي ⦘',type = 'text'},
},
{
{text = '⦗ قسم الاحصائيات ⦘',type = 'text'},{text = '⦗ قسم اعدادات البوت ⦘', type = 'text'},
},
{
{text = '⦗ قسم ردود البوت ⦘',type = 'text'},{text = '⦗ قسم رتب البوت ⦘', type = 'text'},
},
{
{text = '⦗ قسم تفعيل وتعطيل ⦘',type = 'text'},{text = '⦗ قسم الاذاعه ⦘ ', type = 'text'},
},
{
{text = '⦗ قسم الحظر والكتم ⦘',type = 'text'},
},
{
{text = '⦗ قسم ملفات السورس ⦘',type = 'text'},{text = '⦗ قسم اشتراك اجباري ⦘',type = 'text'},
},
{
{text = '⦗ قسم السورس ⦘',type = 'text'},
},
{
{text ='⦗ الغاء ⦘',type ='text'},
},
}
}
return send(msg_chat_id,msg_id,'اهلا بك عزيزي المطور','md', false, false, false, false, reply_markup)
end
end
if text and Redis:get(Fast.."set:chsource"..senderr) then
if text == "الغاء الامر ↯︙" then
Redis:del(Fast.."set:chsource"..senderr)
return send(msg_chat_id,msg_id,'تم الغاء الامر بنجاح ',"md",true)  
end
if text:match("^@(.*)$") then
Redis:del(Fast.."set:chsource"..senderr)
local chsource = text:match("^@(.*)$") 
Redis:set(Fast..'chsource',chsource)
send(msg_chat_id,msg_id,'\n↯︙ تم حفظ قناه السورس')
dofile('Fast.lua')  
else
send(msg_chat_id,msg_id,'\n↯︙ ارسل المعرف بشكل صحيح')
end
end
if text == "تعيين قناه السورس ↯︙" then
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast.."set:chsource"..senderr,true)
send(msg_chat_id,msg_id,'↯︙ ارسل الان معرف قناه السورس ',"md",true)  
end
if text and Redis:get(Fast.."set:devsource"..senderr) then
if text == "الغاء الامر ↯︙" then
Redis:del(Fast.."set:devsource"..senderr)
return send(msg_chat_id,msg_id,'تم الغاء الامر بنجاح ',"md",true)  
end
if text:match("^@(.*)$") then
Redis:del(Fast.."set:devsource"..senderr)
local chsource = text:match("^@(.*)$") 
Redis:set(Fast..'devsource',chsource)
send(msg_chat_id,msg_id,'\n↯︙ تم حفظ مطور السورس')
dofile('Fast.lua')  
else
send(msg_chat_id,msg_id,'\n↯︙ ارسل المعرف بشكل صحيح')
end
end
if text == "تعيين مطور السورس ↯︙" then
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast.."set:devsource"..senderr,true)
send(msg_chat_id,msg_id,'↯︙ ارسل الان معرف مطور السورس ',"md",true)  
end
if Redis:get(Fast.."set:rmz"..senderr) then
if text then
if text == "الغاء الامر ↯︙" then
Redis:del(Fast.."set:rmz"..senderr)
return send(msg_chat_id,msg_id,'تم الغاء الامر بنجاح ',"md",true)  
end
Redis:set(Fast..'rmzsource',text)
Redis:del(Fast.."set:rmz"..senderr)
send(msg_chat_id,msg_id,'تم حفظ رمز السورس ',"md",true)  
dofile('Fast.lua')  
end
end
if text == "تعيين رمز السورس ↯︙" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast.."set:rmz"..senderr,true)
return send(msg_chat_id,msg_id,'ارسل رمز بدل من { ↯︙}',"md",true)  
end
if text == "حذف رمز السورس ↯︙" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast.."rmzsource","↯︙ ")
return send(msg_chat_id,msg_id,'تم ارجاع رمز السورس الي  { ↯︙}',"md",true)  
end
if text == "تفعيل البوت بصوره ❍" then
  if not msg.Asasy then
  bot.sendText(msg_chat_id,msg_id,'\n*❍ هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
  end
  Redis:set(Fast.."name bot type : ", "photo")
  bot.sendText(msg_chat_id,msg_id,'\n*❍ تم تفعيل رد البوت بصوره * ',"md",true)  
  end
if text == "تعطيل البوت بصوره ❍" then
if not msg.Asasy then
bot.sendText(msg_chat_id,msg_id,'\n*❍ هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast.."name bot type : ", "text")
bot.sendText(msg_chat_id,msg_id,'\n*❍ تم تعطيل رد البوت بصوره * ',"md",true)  
end
if text == 'تنظيف المشتركين ↯︙' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."Num:User:Pv")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = bot.getChat(v)
local ChatAction = bot.sendChatAction(v,'Typing')
if ChatAction.Fastbots ~= "ok" then
x = x + 1
Redis:srem(Fast..'Num:User:Pv',v)
end
end
if x ~= 0 then
return send(msg_chat_id,msg_id,'*↯︙ العدد الكلي { '..#list..' }\n↯︙ تم العثور على { '..x..' } من المشتركين حاظرين البوت*',"md")
else
return send(msg_chat_id,msg_id,'*↯︙ العدد الكلي { '..#list..' }\n↯︙ لم يتم العثور على وهميين*',"md")
end
end
if text == 'تنظيف المجموعات ↯︙' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = bot.getChat(v)
if Get_Chat.id then
local statusMem = bot.getChatMember(Get_Chat.id,Fast)
if statusMem.status.Fastbots == "chatMemberStatusMember" then
x = x + 1
send(Get_Chat.id,0,'*↯︙ البوت عضو في الكروب سوف اغادر ويمكنك تفعيلي مره اخره *',"md")
Redis:srem(Fast..'ChekBotAdd',Get_Chat.id)
local keys = Redis:keys(Fast..'*'..Get_Chat.id)
for i = 1, #keys do
Redis:del(keys[i])
end
bot.leaveChat(Get_Chat.id)
end
else
x = x + 1
local keys = Redis:keys(Fast..'*'..v)
for i = 1, #keys do
Redis:del(keys[i])
end
Redis:srem(Fast..'ChekBotAdd',v)
bot.leaveChat(v)
end
end
if x ~= 0 then
return send(msg_chat_id,msg_id,'*↯︙ العدد الكلي { '..#list..' } للمجموعات \n↯︙ تم العثور على { '..x..' } مجموعات البوت ليس ادمن \n↯︙ تم تعطيل الكروب ومغادره البوت من الوهمي *',"md")
else
return send(msg_chat_id,msg_id,'*↯︙ العدد الكلي { '..#list..' } للمجموعات \n↯︙ لا توجد مجموعات وهميه*',"md")
end
end
if text == 'تغيير كليشه ستارت ↯︙' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Change:Start:Bot"..senderr,300,true) 
return send(msg_chat_id,msg_id,"↯︙ ارسل لي كليشه Start الان ","md",true)  
end
if text == 'مسح كليشه ستارت ↯︙' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Start:Bot") 
return send(msg_chat_id,msg_id,"↯︙ تم مسح كليشه Start ","md",true)   
end
if text == 'تغيير اسم البوت ↯︙' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Change:Name:Bot"..senderr,300,true) 
return send(msg_chat_id,msg_id,"↯︙ ارسل لي الاسم الان ","md",true)  
end
if text == 'مسح اسم البوت ↯︙' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Name:Bot") 
return send(msg_chat_id,msg_id,"↯︙ تم مسح اسم البوت ","md",true)   
end
if text and text:match("^تعيين عدد الاعضاء (%d+)$") then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'Num:Add:Bot',text:match("تعيين عدد الاعضاء (%d+)$") ) 
send(msg_chat_id,msg_id,'*↯︙ تم تعيين عدد اعضاء تفعيل البوت اكثر من : '..text:match("تعيين عدد الاعضاء (%d+)$")..' عضو *',"md",true)  
elseif text =='الاحصائيات ↯︙' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id,'*↯︙ عدد احصائيات البوت الكامله \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n↯︙ عدد المجموعات : '..(Redis:scard(Fast..'ChekBotAdd') or 0)..'\n↯︙ عدد المشتركين : '..(Redis:scard(Fast..'Num:User:Pv') or 0)..'*',"md",true)  
end
if text == 'تغيير كليشه المطور ↯︙' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'GetTexting:DevFast'..msg_chat_id..':'..senderr,true)
return send(msg_chat_id,msg_id,'↯︙ ارسل لي الكليشه الان')
end
if text == 'مسح كليشه المطور ↯︙' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast..'Texting:DevFast')
return send(msg_chat_id,msg_id,'↯︙ تم مسح كليشه المطور')
end
if text == 'اضف رد عام ↯︙' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Rd"..senderr..":"..msg_chat_id,true)
return send(msg_chat_id,msg_id,"↯︙ ارسل الان الكلمه لاضافتها في الردود العامه ","md",true)  
end
if text == 'مسح رد عام ↯︙' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:On"..senderr..":"..msg_chat_id,true)
return send(msg_chat_id,msg_id,"↯︙ ارسل الان الكلمه لمسحها من الردود العامه","md",true)  
end
if text=='اذاعه خاص ↯︙' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Users" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,[[
↯︙ارسل لي سواء كان 
❨ ملف ↯︙ملصق ↯︙متحركه ↯︙صوره
 ↯︙فيديو ↯︙بصمه الفيديو ↯︙بصمه ↯︙صوت ↯︙رساله ❩
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
↯︙للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=='اذاعه للمجموعات ↯︙' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Groups" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,[[
↯︙ارسل لي سواء كان 
❨ ملف ↯︙ملصق ↯︙متحركه ↯︙صوره
 ↯︙فيديو ↯︙بصمه الفيديو ↯︙بصمه ↯︙صوت ↯︙رساله ❩
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
↯︙للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه بالتثبيت ↯︙" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,[[
↯︙ارسل لي سواء كان 
❨ ملف ↯︙ملصق ↯︙متحركه ↯︙صوره
 ↯︙فيديو ↯︙بصمه الفيديو ↯︙بصمه ↯︙صوت ↯︙رساله ❩
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
↯︙للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه بالتوجيه ↯︙" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,"↯︙ ارسل لي التوجيه الان\n↯︙ ليتم نشره في المجموعات","md",true)  
return false
end

if text=='اذاعه بالتوجيه خاص ↯︙' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,"↯︙ ارسل لي التوجيه الان\n↯︙ ليتم نشره الى المشتركين","md",true)  
return false
end

if text == ("الردود العامه ↯︙") then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo")
text = "\n📝︙قائمة الردود العامه \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Sudo:Gif"..v) then
db = "متحركه 🎭"
elseif Redis:get(Fast.."Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(Fast.."Add:Rd:Sudo:stekr"..v) then
db = "ملصق 🃏"
elseif Redis:get(Fast.."Add:Rd:Sudo:Text"..v) then
db = "رساله ✉"
elseif Redis:get(Fast.."Add:Rd:Sudo:Photo"..v) then
db = "صوره 🎇"
elseif Redis:get(Fast.."Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(Fast.."Add:Rd:Sudo:File"..v) then
db = "ملف ↯︙"
elseif Redis:get(Fast.."Add:Rd:Sudo:Audio"..v) then
db = "اغنيه 🎵"
elseif Redis:get(Fast.."Add:Rd:Sudo:video_note"..v) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "↯︙ لا توجد ردود للمطور"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
if text == ("مسح الردود العامه ↯︙") then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Sudo:Gif"..v)   
Redis:del(Fast.."Add:Rd:Sudo:vico"..v)   
Redis:del(Fast.."Add:Rd:Sudo:stekr"..v)     
Redis:del(Fast.."Add:Rd:Sudo:Text"..v)   
Redis:del(Fast.."Add:Rd:Sudo:Photo"..v)
Redis:del(Fast.."Add:Rd:Sudo:Video"..v)
Redis:del(Fast.."Add:Rd:Sudo:File"..v)
Redis:del(Fast.."Add:Rd:Sudo:Audio"..v)
Redis:del(Fast.."Add:Rd:Sudo:video_note"..v)
Redis:del(Fast.."List:Rd:Sudo")
end
return send(msg_chat_id,msg_id,"↯︙ تم مسح الردود العامه","md",true)  
end
if text == 'مسح المطورين ↯︙' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Dev:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لا يوجد مطورين حاليا , ","md",true)  
end
Redis:del(Fast.."Dev:Groups") 
return send(msg_chat_id,msg_id,"*↯︙ تم مسح {"..#Info_Members.."} من المطورين *","md",true)
end
if text == 'مسح المطورين الثانويين ↯︙' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Devss:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لا يوجد مطورين حاليا , ","md",true)  
end
Redis:del(Fast.."Devss:Groups") 
return send(msg_chat_id,msg_id,"*↯︙ تم مسح {"..#Info_Members.."} من المطورين *","md",true)
end
if text == 'مسح قائمه العام ↯︙' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."BanAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لا يوجد محظورين عام حاليا , ","md",true)  
end
Redis:del(Fast.."BanAll:Groups") 
return send(msg_chat_id,msg_id,"*↯︙ تم مسح {"..#Info_Members.."} من المحظورين عام *","md",true)
end
if text == 'تعطيل البوت الخدمي ↯︙' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."BotFree") 
return send(msg_chat_id,msg_id,"↯︙ تم تعطيل البوت الخدمي ","md",true)
end
if text == 'تعطيل التواصل ↯︙' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."TwaslBot") 
return send(msg_chat_id,msg_id,"↯︙ تم تعطيل التواصل داخل البوت ","md",true)
end
if text == 'تفعيل البوت الخدمي ↯︙' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."BotFree",true) 
return send(msg_chat_id,msg_id,"↯︙ تم تفعيل البوت الخدمي ","md",true)
end
if text == 'تفعيل التواصل ↯︙' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."TwaslBot",true) 
return send(msg_chat_id,msg_id,"↯︙ تم تفعيل التواصل داخل البوت ","md",true)
end
if text == 'قائمه العام ↯︙' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."BanAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لا يوجد محظورين عام حاليا , ","md",true)  
end
ListMembers = '\n*↯︙ قائمه المحظورين عام  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)

if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المحظورين عام', data = senderr..'/BanAll'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المطورين ↯︙' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Dev:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لا يوجد مطورين حاليا , ","md",true)  
end
ListMembers = '\n*↯︙ قائمه مطورين البوت \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المطورين', data = senderr..'/Dev'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المطورين الثانويين ↯︙' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Devss:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لا يوجد مطورين حاليا , ","md",true)  
end
ListMembers = '\n*↯︙ قائمه مطورين البوت \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المطورين', data = senderr..'/Dev'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if not msg.Asasy then
if Redis:get(Fast.."TwaslBot") and not Redis:sismember(Fast.."BaN:In:Tuasl",senderr) then
local ListGet = {Sudo_Id,senderr}
local IdSudo = bot.getChat(ListGet[1]).id
local IdUser = bot.getChat(ListGet[2]).id
local FedMsg = bot.sendForwarded(IdSudo, 0, IdUser, msg_id)
Redis:setex(Fast.."Twasl:UserId"..msg.date,172800,IdUser)
if FedMsg.content.Fastbots == "messageSticker" then
send(IdSudo,0,Reply_Status(IdUser,'↯︙ قام بارسال الملصق').Reply,"md",true)  
end
return send(IdUser,msg_id,Reply_Status(IdUser,'↯︙ تم ارسال رسالتك الى المطور').Reply,"md",true)  
end
else 
if msg.reply_to_message_id ~= 0 then
local Message_Get = bot.getMessage(msg_chat_id, msg.reply_to_message_id)
if Message_Get.forward_info then
local Info_User = Redis:get(Fast.."Twasl:UserId"..Message_Get.forward_info.date) or 46899864
if text == 'حظر' then
Redis:sadd(Fast..'BaN:In:Tuasl',Info_User)  
return send(msg_chat_id,msg_id,Reply_Status(Info_User,'↯︙ تم حظره من تواصل البوت ').Reply,"md",true)  
end 
if text =='الغاء الحظر' or text =='الغاء حظر' then
Redis:srem(Fast..'BaN:In:Tuasl',Info_User)  
return send(msg_chat_id,msg_id,Reply_Status(Info_User,'↯︙ تم الغاء حظره من تواصل البوت ').Reply,"md",true)  
end 
local ChatAction = bot.sendChatAction(Info_User,'Typing')
if not Info_User or ChatAction.message == "USER_IS_BLOCKED" then
send(msg_chat_id,msg_id,Reply_Status(Info_User,'↯︙ قام بحظر البوت لا استطيع ارسال رسالتك ').Reply,"md",true)  
end
if msg.content.video_note then
bot.sendVideoNote(Info_User, 0, msg.content.video_note.video.remote.id)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
bot.sendPhoto(Info_User, 0, idPhoto,'')
elseif msg.content.sticker then 
bot.sendSticker(Info_User, 0, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then 
bot.sendVoiceNote(Info_User, 0, msg.content.voice_note.voice.remote.id, '', 'md')
elseif msg.content.video then 
bot.sendVideo(Info_User, 0, msg.content.video.video.remote.id, '', "md")
elseif msg.content.animation then 
bot.sendAnimation(Info_User,0, msg.content.animation.animation.remote.id, '', 'md')
elseif msg.content.document then
bot.sendDocument(Info_User, 0, msg.content.document.document.remote.id, '', 'md')
elseif msg.content.audio then
bot.sendAudio(Info_User, 0, msg.content.audio.audio.remote.id, '', "md") 
elseif text then
send(Info_User,0,text,"md",true)
end 
send(msg_chat_id,msg_id,Reply_Status(Info_User,'↯︙ تم ارسال رسالتك اليه ').Reply,"md",true)  
end
end
end 
end --UserBot
end -- File_Bot_Run
function CallBackLua(data) --- هذا الكالباك بي الابديت 
RunCallBack(data)
end
Redis:sadd(Fast.."eza3a",Token.."&"..Fast)
Redis:set("@"..UserBot,Fast.."&".."@"..UserBot.."$@"..UserSudo.."+"..Token)
Fx.Fastbots.run(CallBackLua)