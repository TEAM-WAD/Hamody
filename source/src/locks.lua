function lockss(msg)
text = nil
if msg and msg.content and msg.content.text then
xname =  (Redis:get(Fast.."Name:Bot") or "بروكس") 
text = msg.content.text.text
if text:match("^"..xname.." (.*)$") then
text = text:match("^"..xname.." (.*)$")
end
end
msg_chat_id = msg.chat_id
msg_id = msg.id
msg_reply_id = msg.reply_to_message_id
msg_user_send_id = msg.sender_id.user_id
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text) or Redis:get(Fast.."All:Get:Reides:Commands:Group"..text)
if neww then
text = neww or text
end
end
if TextMsg == 'البوت الخدمي' then
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
if TextMsg == 'التواصل' then
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
end

if text == "اطردني" or text == "طردني" then
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"\n*↯︙ عذرآ البوت ليس ادمن في الكروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n*↯︙ البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if StatusCanOrNotCan(msg_chat_id,senderr) then
return send(msg_chat_id,msg_id,"\n*↯︙ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,senderr).." } *","md",true)  
end
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
KickMe = true
elseif (StatusMember == "chatMemberStatusAdministrator") then
KickMe = true
else
KickMe = false
end
if KickMe == true then
return send(msg_chat_id,msg_id,"*↯︙ عذرا لا استطيع طرد ادمنيه ومنشئين الكروب*","md",true)    
end
bot.setChatMemberStatus(msg.chat_id,senderr,'restricted',{1,1,1,1,1,1,1,1,1})
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم طردك من الكروب بنائآ على طلبك").Reply,"md",true)  
end


if text == 'الغاء' or text == 'الغاء الامر ↯︙' then 
Redis:del(Fast..'Channel:Redis'..msg_chat_id..':'..senderr)
return send(msg_chat_id,msg_id,'↯︙ تم الغاء حفظ قناة الاشتراك')
end
Redis:del(Fast..'Channel:Redis'..msg_chat_id..':'..senderr)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = bot.searchPublicChat(text)
if not UserId_Info.id then
Redis:del(Fast..'Channel:Redis'..msg_chat_id..':'..senderr)
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
local ChannelUser = text:gsub('@','')
if UserId_Info.type.is_channel == true then
local StatusMember = bot.getChatMember(UserId_Info.id,Fast).status.Fastbots
if (StatusMember ~= "chatMemberStatusAdministrator") then
return send(msg_chat_id,msg_id,"\n↯︙ البوت عضو في القناة يرجى رفع البوت ادمن واعادة وضع الاشتراك ","md",true)  
end
Redis:set(Fast..'Channel:Join',ChannelUser) 
Redis:set(Fast..'Channel:Join:Name',UserId_Info.title) 
return send(msg_chat_id,msg_id,"\n↯︙ تم تعيين الاشتراك الاجباري على قناة : [@"..ChannelUser..']',"md",true)  
else
return send(msg_chat_id,msg_id,"\n↯︙ هذا ليس معرف قناة يرجى ارسال معرف القناة الصحيح: [@"..ChannelUser..']',"md",true)  
end
end
end

if text == 'تغيير الاشتراك الاجباري' or text == '⦗تغير الاشتراك الاجباري⦘' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:set(Fast..'Channel:Redis'..msg_chat_id..':'..senderr,true)
return send(msg_chat_id,msg_id,"\n↯︙ ارسل الي الان قناة الاشتراك ","md",true)  
end
if text == 'الاشتراك الاجباري' or text == '⦗الاشتراك لاجباري⦘' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local Channel = Redis:get(Fast..'Channel:Join')
if Channel then
return send(msg_chat_id,msg_id,"\n↯︙ الاشتراك الاجباري مفعل على : [@"..Channel..']',"md",true)  
else
return send(msg_chat_id,msg_id,"\n↯︙ لا توجد قناة في الاشتراك ارسل تغيير الاشتراك الاجباري","md",true)  
end
end

if (Redis:get(Fast..'Chat:Channel:Redis'..msg_chat_id..':'..senderr) == 'true') then
if text == 'الغاء' or text == 'الغاء الامر ↯︙' then 
Redis:del(Fast..'Chat:Channel:Redis'..msg_chat_id..':'..senderr)
return send(msg_chat_id,msg_id,'↯︙ تم الغاء حفظ قناة الاشتراك')
end
Redis:del(Fast..'Chat:Channel:Redis'..msg_chat_id..':'..senderr)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = bot.searchPublicChat(text)
if not UserId_Info.id then
Redis:del(Fast..'Chat:Channel:Redis'..msg_chat_id..':'..senderr)
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
local ChannelUser = text:gsub('@','')
if UserId_Info.type.is_channel == true then
local StatusMember = bot.getChatMember(UserId_Info.id,Fast).status.Fastbots
if (StatusMember ~= "chatMemberStatusAdministrator") then
return send(msg_chat_id,msg_id,"\n↯︙ البوت عضو في القناة يرجى رفع البوت ادمن واعادة وضع الاشتراك ","md",true)  
end
Redis:set(Fast..'Chat:Channel:Join'..msg_chat_id,ChannelUser) 
Redis:set(Fast..'Chat:Channel:Join:Name'..msg_chat_id,UserId_Info.title) 
return send(msg_chat_id,msg_id,"\n↯︙ تم تعيين الاشتراك الاجباري على قناة : [@"..ChannelUser..']',"md",true)  
else
return send(msg_chat_id,msg_id,"\n↯︙ هذا ليس معرف قناة يرجى ارسال معرف القناة الصحيح: [@"..ChannelUser..']',"md",true)  
end
end
end

if text == "⦗ المجموعات ⦘" then
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
send(msg.chat_id,msg.id,"↯︙ جاري جلب الروابط ..")
local G = "جروبات البوت :\n"
local list = Redis:smembers(Fast..'ChekBotAdd')  
for k,v in pairs(list) do  
local Get_Chat = bot.getChat(v)
local Info_Chats = bot.getSupergroupFullInfo(v)
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
G = G.."اسم المجموعه : "..title.."\n ايدي المجموعه : "..v.."\nرابط المجموعه : "..link.."\n\n"
end
local File = io.open('./'..UserBot..'.txt', "w")
File:write(G)
File:close()
bot.sendDocument(msg_chat_id,msg_id,'./'..UserBot..'.txt', '↯︙ تم جلب روابط المجموعات\n', 'md')
end


if text == 'جلب النسخه الاحتياطيه ↯︙' or text == '⦗  جلب النسخه الاحتياطيه⦘' then
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
local Groups = Redis:smembers(Fast..'ChekBotAdd')  
local UsersBot = Redis:smembers(Fast..'Num:User:Pv')  
local Get_Json = '{"BotId": '..Fast..','  
if #UsersBot ~= 0 then 
Get_Json = Get_Json..'"UsersBot":['  
for k,v in pairs(UsersBot) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..']'
end
Get_Json = Get_Json..',"GroupsBot":{'
for k,v in pairs(Groups) do   
local President = Redis:smembers(Fast.."SuperCreator:Group"..v)
local Constructor = Redis:smembers(Fast.."Creator:Group"..v)
local Manager = Redis:smembers(Fast.."Manger:Group"..v)
local Admin = Redis:smembers(Fast.."Admin:Group"..v)
local Vips = Redis:smembers(Fast.."Special:Group"..v)
if k == 1 then
Get_Json = Get_Json..'"'..v..'":{'
else
Get_Json = Get_Json..',"'..v..'":{'
end
if #President ~= 0 then 
Get_Json = Get_Json..'"President":['
for k,v in pairs(President) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Constructor ~= 0 then
Get_Json = Get_Json..'"Constructor":['
for k,v in pairs(Constructor) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Manager ~= 0 then
Get_Json = Get_Json..'"Manager":['
for k,v in pairs(Manager) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Admin ~= 0 then
Get_Json = Get_Json..'"Admin":['
for k,v in pairs(Admin) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Vips ~= 0 then
Get_Json = Get_Json..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
Get_Json = Get_Json..'"Dev":"FPFFG"}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./'..UserBot..'.json', "w")
File:write(Get_Json)
File:close()
return bot.sendDocument(msg_chat_id,msg_id,'./'..UserBot..'.json', '*↯︙ تم جلب النسخه الاحتياطيه\n↯︙ تحتوي على {'..#Groups..'} جروب \n↯︙ وتحتوي على {'..#UsersBot..'} مشترك *\n', 'md')
end
if text == '⦗ تفعيل جلب النسخه التلقائيه⦘' then   
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:setex(Fast.."Status:SendFile",43200,true) 
return send(msg_chat_id,msg_id,"⌯︙تم تفعيل جلب نسخة الكروبات التلقائيه","md")
end
if text == '⦗تعطيل جلب النسخه التلقائيه⦘' then   
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:del(Fast.."Status:SendFile") 
return send(msg_chat_id,msg_id,"⌯︙تم تعطيل جلب نسخة الكروبات التلقائيه","md")
end

if tonumber(Redis:ttl(Fast.."Status:SendFile")) <= 1 then
local Get_Json = '{"BotId": '..Fast..','  
Get_Json = Get_Json..'"GroupsBotreply":{'
listrep = Redis:smembers(Fast.."List:Rd:Sudo:mz")
if #listrep >= 5 then
for k,v in pairs(listrep) do
if Redis:get(Fast.."Add:Rd:Sudo:mz:Gif"..v) then
db = "gif@"..Redis:get(Fast.."Add:Rd:Sudo:mz:Gif"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:vico"..v) then
db = "Vico@"..Redis:get(Fast.."Add:Rd:Sudo:mz:vico"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:stekr"..v) then
db = "Stekrs@"..Redis:get(Fast.."Add:Rd:Sudo:mz:stekr"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Text"..v) then
db = "Text@"..Redis:get(Fast.."Add:Rd:Sudo:mz:Text"..v)
db = string.gsub(db,'"','')
db = string.gsub(db,"'",'')
db = string.gsub(db,'*','')
db = string.gsub(db,'`','')
db = string.gsub(db,'{','')
db = string.gsub(db,'}','')
db = string.gsub(db,'\n',' ')
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Photo"..v) then
db = "Photo@"..Redis:get(Fast.."Add:Rd:Sudo:mz:Photo"..v) 
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Video"..v) then
db = "Video@"..Redis:get(Fast.."Add:Rd:Sudo:mz:Video"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:File"..v) then
db = "File@"..Redis:get(Fast.."Add:Rd:Sudo:mz:File"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Audio"..v) then
db = "Audio@"..Redis:get(Fast.."Add:Rd:Sudo:mz:Audio"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:video_note"..v) then
db = "video_note@"..Redis:get(Fast.."Add:Rd:Sudo:mz:video_note"..v)
end
v = string.gsub(v,'"','')
v = string.gsub(v,"'",'')
Get_Json = Get_Json..'"'..v..'":"'..db..'",'
end   
Get_Json = Get_Json..'"mahmoud":"ok"'
end
Get_Json = Get_Json..'}}'
local File = io.open('./Mz_rd.json', "w")
File:write(Get_Json)
File:close()
bot.sendDocument(Sudo_Id,0,'./Mz_rd.json', '', 'md')
local devs = Redis:smembers(Fast.."Dev:Groups") 
jsonn = '{"dev":['
if #devs ~= 0 then
for _,v in pairs(devs) do
if _ == 1 then
jsonn = jsonn..'"'..v..'"'
else
jsonn = jsonn..',"'..v..'"'
end
end
end
jsonn = jsonn..'],"devss":['
local devss = Redis:smembers(Fast.."Devss:Groups") 
if #devss ~= 0 then
for _,v in pairs(devss) do
if _ == 1 then
jsonn = jsonn..'"'..v..'"'
else
jsonn = jsonn..',"'..v..'"'
end
end
end
jsonn = jsonn..']}'
local File = io.open('./devs.json', "w")
File:write(jsonn)
File:close()
bot.sendDocument(Sudo_Id,0,'./devs.json', '↯︙ تم جلب المطورين\n↯︙ تحتوي على '..#devs..' مطور و '..#devss..' مطور ثانوي\n', 'md')
local Get_Json = '{"BotId": '..Fast..','  
Get_Json = Get_Json..'"GroupsBotreply":{'
local Groups = Redis:smembers(Fast..'ChekBotAdd')  
for k,ide in pairs(Groups) do   
listrep = Redis:smembers(Fast.."List:Manager"..ide.."")
if k == 1 then
Get_Json = Get_Json..'"'..ide..'":{'
else
Get_Json = Get_Json..',"'..ide..'":{'
end
if #listrep >= 5 then
for k,v in pairs(listrep) do
if Redis:get(Fast.."Add:Rd:Manager:Gif"..v..ide) then
db = "gif@"..Redis:get(Fast.."Add:Rd:Manager:Gif"..v..ide)
elseif Redis:get(Fast.."Add:Rd:Manager:Vico"..v..ide) then
db = "Vico@"..Redis:get(Fast.."Add:Rd:Manager:Vico"..v..ide)
elseif Redis:get(Fast.."Add:Rd:Manager:Stekrs"..v..ide) then
db = "Stekrs@"..Redis:get(Fast.."Add:Rd:Manager:Stekrs"..v..ide)
elseif Redis:get(Fast.."Add:Rd:Manager:Text"..v..ide) then
db = "Text@"..Redis:get(Fast.."Add:Rd:Manager:Text"..v..ide)
db = string.gsub(db,'"','')
db = string.gsub(db,"'",'')
db = string.gsub(db,'*','')
db = string.gsub(db,'`','')
db = string.gsub(db,'{','')
db = string.gsub(db,'}','')
db = string.gsub(db,'\n',' ')
elseif Redis:get(Fast.."Add:Rd:Manager:Photo"..v..ide) then
db = "Photo@"..Redis:get(Fast.."Add:Rd:Manager:Photo"..v..ide) 
elseif Redis:get(Fast.."Add:Rd:Manager:Video"..v..ide) then
db = "Video@"..Redis:get(Fast.."Add:Rd:Manager:Video"..v..ide)
elseif Redis:get(Fast.."Add:Rd:Manager:File"..v..ide) then
db = "File@"..Redis:get(Fast.."Add:Rd:Manager:File"..v..ide)
elseif Redis:get(Fast.."Add:Rd:Manager:Audio"..v..ide) then
db = "Audio@"..Redis:get(Fast.."Add:Rd:Manager:Audio"..v..ide)
elseif Redis:get(Fast.."Add:Rd:Manager:video_note"..v..ide) then
db = "video_note@"..Redis:get(Fast.."Add:Rd:Manager:video_note"..v..ide)
end
v = string.gsub(v,'"','')
v = string.gsub(v,"'",'')
Get_Json = Get_Json..'"'..v..'":"'..db..'",'
end   
Get_Json = Get_Json..'"mahmoud":"ok"'
end
Get_Json = Get_Json..'}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./ReplyGroups.json', "w")
File:write(Get_Json)
File:close()
bot.sendDocument(Sudo_Id,0,'./ReplyGroups.json', '', 'md')

local Groups = Redis:smembers(Fast..'ChekBotAdd')  
local UsersBot = Redis:smembers(Fast..'Num:User:Pv')  
local Get_Json = '{"BotId": '..Fast..','  
if #UsersBot ~= 0 then 
Get_Json = Get_Json..'"UsersBot":['  
for k,v in pairs(UsersBot) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..']'
end
Get_Json = Get_Json..',"GroupsBot":{'
for k,v in pairs(Groups) do   
local President = Redis:smembers(Fast.."SuperCreator:Group"..v)
local Constructor = Redis:smembers(Fast.."Creator:Group"..v)
local Manager = Redis:smembers(Fast.."Manger:Group"..v)
local Admin = Redis:smembers(Fast.."Admin:Group"..v)
local Vips = Redis:smembers(Fast.."Special:Group"..v)
if k == 1 then
Get_Json = Get_Json..'"'..v..'":{'
else
Get_Json = Get_Json..',"'..v..'":{'
end
if #President ~= 0 then 
Get_Json = Get_Json..'"President":['
for k,v in pairs(President) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Constructor ~= 0 then
Get_Json = Get_Json..'"Constructor":['
for k,v in pairs(Constructor) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Manager ~= 0 then
Get_Json = Get_Json..'"Manager":['
for k,v in pairs(Manager) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Admin ~= 0 then
Get_Json = Get_Json..'"Admin":['
for k,v in pairs(Admin) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Vips ~= 0 then
Get_Json = Get_Json..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
Get_Json = Get_Json..'"Dev":"FPFFG"}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./'..UserBot..'.json', "w")
File:write(Get_Json)
File:close()
bot.sendDocument(Sudo_Id,0,'./'..UserBot..'.json', '*↯︙ تم جلب النسخه الاحتياطيه\n↯︙ تحتوي على {'..#Groups..'} جروب \n↯︙ وتحتوي على {'..#UsersBot..'} مشترك *\n', 'md')
local Get_Json = '{"BotId": '..Fast..','  
Get_Json = Get_Json..'"GroupsBotreply":{'
listrep = Redis:smembers(Fast.."List:Rd:Sudo")
if #listrep >= 5 then
for k,v in pairs(listrep) do
if Redis:get(Fast.."Add:Rd:Sudo:Gif"..v) then
db = "gif@"..Redis:get(Fast.."Add:Rd:Sudo:Gif"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:vico"..v) then
db = "Vico@"..Redis:get(Fast.."Add:Rd:Sudo:vico"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:stekr"..v) then
db = "Stekrs@"..Redis:get(Fast.."Add:Rd:Sudo:stekr"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:Text"..v) then
db = "Text@"..Redis:get(Fast.."Add:Rd:Sudo:Text"..v)
db = string.gsub(db,'"','')
db = string.gsub(db,"'",'')
db = string.gsub(db,'*','')
db = string.gsub(db,'`','')
db = string.gsub(db,'{','')
db = string.gsub(db,'}','')
db = string.gsub(db,'\n',' ')
elseif Redis:get(Fast.."Add:Rd:Sudo:Photo"..v) then
db = "Photo@"..Redis:get(Fast.."Add:Rd:Sudo:Photo"..v) 
elseif Redis:get(Fast.."Add:Rd:Sudo:Video"..v) then
db = "Video@"..Redis:get(Fast.."Add:Rd:Sudo:Video"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:File"..v) then
db = "File@"..Redis:get(Fast.."Add:Rd:Sudo:File"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:Audio"..v) then
db = "Audio@"..Redis:get(Fast.."Add:Rd:Sudo:Audio"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:video_note"..v) then
db = "video_note@"..Redis:get(Fast.."Add:Rd:Sudo:video_note"..v)
end
v = string.gsub(v,'"','')
v = string.gsub(v,"'",'')
Get_Json = Get_Json..'"'..v..'":"'..db..'",'
end   
Get_Json = Get_Json..'"mahmoud":"ok"'
end

Get_Json = Get_Json..'}}'
local File = io.open('./Groups_all.json', "w")
File:write(Get_Json)
File:close()
bot.sendDocument(Sudo_Id,0,'./Groups_all.json', '', 'md')
Redis:setex(Fast.."Status:SendFile",43200,true) 
end


if text == "تعطيل منع التصفيه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if Redis:get(Fast..'spammkick'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'↯︙ تم تعطيل منع التصفيه مسبقا\n ✓',"md")
else
Redis:set(Fast.."spammkick"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,'↯︙ تم تعطيل منع التصفيه\n ✓',"md")
end
end
if text == "تفعيل منع التصفيه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if not Redis:get(Fast..'spammkick'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'↯︙ تم تفعيل منع التصفيه مسبقا\n ✓',"md")
else
Redis:del(Fast.."spammkick"..msg.chat_id)
return send(msg_chat_id,msg_id,'↯︙ تم تفعيل منع التصفيه\n ✓',"md")
end
end

if text == "تعطيل المسح التلقائي" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end        
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
Redis:del(Fast.."Status:Del:Media"..msg.chat_id)
 send(msg_chat_id,msg_id,'↯︙ تم تعطيل المسح التلقائي للميديا')
return false
end 
if text == "تفعيل المسح التلقائي" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end        
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
Redis:set(Fast.."Status:Del:Media"..msg.chat_id,true)
send(msg_chat_id,msg_id,'↯︙ تم تفعيل المسح التلقائي للميديا')
return false
end 
if text and text:match('^تفعيل الوضع المدفوع (-100%d+)$') then
local Chatid = text:match('^تفعيل الوضع المدفوع (-100%d+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local Get_Chat = bot.getChat(Chatid)
if not data.id then
send(msg_chat_id,msg_id,'- لا توجد جروب في البوت بهذا الايدي')
return false
end
Redis:sadd(Fast.."BotFree:Group:",Chatid)
send(msg_chat_id,msg_id,'- تم تفعيل الوضع المدفوع بنجاح على : ['..Get_Chat.title..']')
end 
if text and text:match('^الغاء الوضع المدفوع (-100%d+)$') then
local Chatid = text:match('^الغاء الوضع المدفوع (-100%d+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:srem(Fast.."BotFree:Group:",Chatid)
send(msg_chat_id,msg_id,'- تم الغاء الوضع المدفوع عن الكروب ')
end 

end
return {Fast = lockss}