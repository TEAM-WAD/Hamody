function setrtb(msg)
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
if text == 'رفع مطور مساعد' then
if Userban and Userban.type and Userban.type.bot == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هاذا الامر يخص ⦗  '..Controller_Num(1)..'  ⦘* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/'..Redis:get(Fast..'ch:admin')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local Userban = bot.getUser(Message_Reply.sender_id.user_id)
if Redis:sismember(Fast.."Specialall:Group",Message_Reply.sender_id.user_id) then
return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"↯︙ تم ترقيته مطور مساعد مسبقا ").Reply,"md",true)  
else
Redis:del(Fast.."Specialall:Group") 
Redis:sadd(Fast.."Specialall:Group", Message_Reply.sender_id.user_id)
Redis:set(Fast.."id:Specialall:Group", Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"↯︙ تم ترقيته  مطور مساعد").Reply,"md",true)  
end
end
if text == 'تنزيل مطور مساعد' then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.bot == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not msg.Asasy then
return send(msg_chat_id,msg_id,'\n*↯︙ هاذا الامر يخص ⦗  '..Controller_Num(1)..'  ⦘* ',"md",true)  
end
if not msg.Asasy then
return send(msg_chat_id,msg_id,'\n*↯︙ هاذا الامر يخص ⦗  '..Controller_Num(1)..'  ⦘* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/'..Redis:get(Fast..'ch:admin')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Specialall:Group",Message_Reply.sender_id.user_id) then
return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"↯︙ تم تنزيله مطور مساعد مسبقا ").Reply,"md",true)  
else
Redis:del(Fast.."Specialall:Group")
Redis:del(Fast.."Specialall:Group", Message_Reply.sender_id.user_id)
Redis:del(Fast.."id:Specialall:Group", Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"↯︙ تم تنزيله مطور مساعد").Reply,"md",true)  
end
end
if text and text:match('^رفع مطور اساسي @(%S+)$') then
local UserName = text:match('^رفع مطور اساسي @(%S+)$')
if tonumber(senderr) == tonumber(Sudo_Id) then
YouCan = true
elseif tonumber(senderr) == tonumber(6264438859) then
YouCan = true
elseif tonumber(senderr) == tonumber(6264438859) then
YouCan = true
else
YouCan = false
end
if YouCan == false then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗ مطور الاساسي ⦘* ',"md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف قناة او ڪروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if Redis:sismember(Fast.."ControlAll:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ↯︙تم رفعه مطور اساسي مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."ControlAll:Groups",UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ↯︙تم رفعه مطور اساسي ").Reply,"md",true)  
end
end
if text and text:match('^تنزيل مطور اساسي @(%S+)$') then
local UserName = text:match('^تنزيل مطور اساسي @(%S+)$')
if tonumber(senderr) == tonumber(Sudo_Id) then
YouCan = true
elseif tonumber(senderr) == tonumber(6264438859) then
YouCan = true
elseif tonumber(senderr) == tonumber(6264438859) then
YouCan = true
else
YouCan = false
end
if YouCan == false then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗ مطور الاساسي ⦘* ',"md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف قناة او ڪروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if not Redis:sismember(Fast.."ControlAll:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ↯︙تم تنزيله من المطورين الاساسيين مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."ControlAll:Groups",UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ↯︙تم تنزيله من المطوريين الاساسسين").Reply,"md",true)  
end
end
if text == ('رفع مطور اساسي') and msg.reply_to_message_id ~= 0 then
if tonumber(senderr) == tonumber(Sudo_Id) then
YouCan = true
elseif tonumber(senderr) == tonumber(6264438859) then
YouCan = true
elseif tonumber(senderr) == tonumber(6264438859) then
YouCan = true
else
YouCan = false
end
if YouCan == false then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗ مطور الاساسي ⦘* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if Redis:sismember(Fast.."ControlAll:Groups",rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ↯︙تم رفعه مطور اساسي مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."ControlAll:Groups",rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ↯︙تم رفعه مطور اساسي ").Reply,"md",true)  
end
end
if text == ('تنزيل مطور اساسي') and msg.reply_to_message_id ~= 0 then
if tonumber(senderr) == tonumber(Sudo_Id) then
YouCan = true
elseif tonumber(senderr) == tonumber(6264438859) then
YouCan = true
elseif tonumber(senderr) == tonumber(6264438859) then
YouCan = true
else
YouCan = false
end
if YouCan == false then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗ مطور الاساسي ⦘* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not Redis:sismember(Fast.."ControlAll:Groups",rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ↯︙تم تنزيله من المطورين الاساسسين مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."ControlAll:Groups",rep_idd)
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ↯︙تم تنزيله من المطوريين الاساسسين").Reply,"md",true)  
end
end
if text and text:match('^رفع مطور اساسي (%d+)$') then
local UserId = text:match('^رفع مطور اساسي (%d+)$')
if tonumber(senderr) == tonumber(Sudo_Id) then
YouCan = true
elseif tonumber(senderr) == tonumber(6264438859) then
YouCan = true
elseif tonumber(senderr) == tonumber(6264438859) then
YouCan = true
else
YouCan = false
end
if YouCan == false then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗ مطور الاساسي ⦘* ',"md",true)  
end
local UserInfo = bot.getUser(UserId)
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if Redis:sismember(Fast.."ControlAll:Groups",UserId) then
return send(msg_chat_id,msg_id,Reply_Status(UserId," ↯︙تم رفعه مطور اساسي مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."ControlAll:Groups",UserId) 
return send(msg_chat_id,msg_id,Reply_Status(UserId," ↯︙تم رفعه مطور اساسي ").Reply,"md",true)  
end
end
if text and text:match('^تنزيل مطور اساسي (%d+)$') then
local UserId = text:match('^تنزيل مطور اساسي (%d+)$')
if tonumber(senderr) == tonumber(Sudo_Id) then
YouCan = true
elseif tonumber(senderr) == tonumber(6264438859) then
YouCan = true
elseif tonumber(senderr) == tonumber(6264438859) then
YouCan = true
else
YouCan = false
end
if YouCan == false then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗ مطور الاساسي ⦘* ',"md",true)  
end
local UserInfo = bot.getUser(UserId)
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if not Redis:sismember(Fast.."ControlAll:Groups",UserId) then
return send(msg_chat_id,msg_id,Reply_Status(UserId," ↯︙تم تنزيله من المطوريين الاساسسين مسبقا").Reply,"md",true)  
else
Redis:srem(Fast.."ControlAll:Groups",UserId) 
return send(msg_chat_id,msg_id,Reply_Status(UserId," ↯︙تم تنزيله من المطوريين الاساسسين").Reply,"md",true)  
end
end
if text == 'مسح المطورين الاساسيين' then
if tonumber(senderr) == tonumber(Sudo_Id) then
YouCan = true
elseif tonumber(senderr) == tonumber(6264438859) then
YouCan = true
elseif tonumber(senderr) == tonumber(6264438859) then
YouCan = true
else
YouCan = false
end
if YouCan == false then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗ مطور الاساسي ⦘* ',"md",true)  
end
local Info_Members = Redis:smembers(Fast.."ControlAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id," ↯︙لا يوجد مطورين اساسيين حاليا , ","md",true)  
end
Redis:del(Fast.."ControlAll:Groups") 
return send(msg_chat_id,msg_id,"* ↯︙تم مسح {"..#Info_Members.."} من المطورين الاساسيين *","md",true)
end
if text == 'المطورين الاساسيين' then
if tonumber(senderr) == tonumber(Sudo_Id) then
YouCan = true
elseif tonumber(senderr) == tonumber(6264438859) then
YouCan = true
elseif tonumber(senderr) == tonumber(6264438859) then
YouCan = true
else
YouCan = false
end
if YouCan == false then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗ مطور الاساسي ⦘* ',"md",true)  
end
local Info_Members = Redis:smembers(Fast.."ControlAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id," ↯︙لا يوجد مطورين اساسيين حاليا , ","md",true)  
end
ListMembers = '\n*↯︙ قائمه المطورين الاساسيين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
return send(msg_chat_id, msg_id, ListMembers, 'md', true)
end
if text == '↯︙ المساعد' or text == 'المطور المساعد' then   
local id = Redis:get(Fast.."id:Specialall:Group")
local url = https.request('http://api.telegram.org/bot'..Token..'/getchat?chat_id='..id)
local banyt = JSON.decode(url)
local name = ' '..banyt.result.first_name..' '
if banyt.result.username then
apapiy = ' '..banyt.result.username..' '
else
apapiy = 'FA9SH'
end
if banyt.result.first_name then
klajq = ' '..banyt.result.first_name..' '
else
klajq = 'لا يوجد'
end
local abnj = "**["..name.." ](t.me/"..banyt.result.username..")*\n*"
keybanyt = {} 
keybanyt.inline_keyboard = {
{
{text = name, url = "https://t.me/"..banyt.result.username..""},
},
}
local msg_id = msg.id/2097152/0.5 
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&reply_to_message_id="..msg_id.."&photo=t.me/"..banyt.result.username.."&caption="..URL.escape(abnj).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keybanyt))
end
if text == ('رفع مدير عام') and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(1)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"\n*↯︙ عذرآ البوت ليس ادمن في الكروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:sadd(Fast.."Specialall:Group",rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم رفعه مدير عام ").Reply,"md",true)  
end
if text and text:match('^رفع مدير عام @(%S+)$') then
local UserName = text:match('^رفع مدير عام @(%S+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(1)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"\n*↯︙ عذرآ البوت ليس ادمن في الكروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف قناة او ڪروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
Redis:sadd(Fast.."Specialall:Group",UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم رفعه مدير عام ").Reply,"md",true)  
end 
if text == ('تنزيل مدير عام') and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(1)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"\n*↯︙ عذرآ البوت ليس ادمن في الكروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:srem(Fast.."Specialall:Group",rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله مدير عام ").Reply,"md",true)  
end
if text and text:match('^تنزيل مدير عام @(%S+)$') then
local UserName = text:match('^تنزيل مدير عام @(%S+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(1)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"\n*↯︙ عذرآ البوت ليس ادمن في الكروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف قناة او ڪروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
Redis:srem(Fast.."Specialall:Group",UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم تنزيله مدير عام ").Reply,"md",true)  
end 


if text and text:match('^تنزيل (.*) @(%S+)$') then
local UserName = {text:match('^تنزيل (.*) @(%S+)$')}
local UserId_Info = bot.searchPublicChat(UserName[2])
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف قناة او ڪروب ","md",true)  
end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if UserName[1] == "مطور ثانوي" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(1)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Devss:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم تنزيله مطور ثانوي مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Devss:Groups",UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم تنزيله مطور ثانوي").Reply,"md",true)  
end
end
if UserName[1] == "مطور" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(2)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Dev:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم تنزيله مطور مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Dev:Groups",UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم تنزيله مطور ").Reply,"md",true)  
end
end
if UserName[1] == "مالك" then
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Dev then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(3)..' , مالك الكروب }* ',"md",true)  
end
if not Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم تنزيله مالك مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم تنزيله مالك ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ اساسي" then
if not msg.Ownerss then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(8)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم تنزيله منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم تنزيله منشئ اساسي ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ" then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(4)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Creator:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم تنزيله من المنشئين مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Creator:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم تنزيله من المنشئين ").Reply,"md",true)  
end
end
if UserName[1] == "مدير" then
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(5)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Manger:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم تنزيله من المدراء مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Manger:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم تنزيله من المدراء ").Reply,"md",true)  
end
end
if UserName[1] == "ادمن" then
if Redis:sismember(Fast.."Specialall:Group",senderr) then
testmod = true
elseif msg.Manger then
testmod = true
else
testmod = false
end
if testmod == false then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Admin:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم تنزيله من الادمنيه مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Admin:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم تنزيله من الادمنيه ").Reply,"md",true)  
end
end
if UserName[1] == "مميز" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(7)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Special:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم تنزيله من المميزين مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Special:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم تنزيله من المميزبن ").Reply,"md",true)  
end
end
end
if text and text:match("^تنزيل (.*)$") and msg.reply_to_message_id ~= 0 then
local TextMsg = text:match("^تنزيل (.*)$")
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if TextMsg == 'مطور ثانوي' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(1)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Devss:Groups",rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله مطور ثانوي مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Devss:Groups",rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله مطور ثانوي").Reply,"md",true)  
end
end
if TextMsg == 'مطور' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(2)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Dev:Groups",rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله مطور مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Dev:Groups",rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله مطور ").Reply,"md",true)  
end
end
if TextMsg == "مالك" then
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Dev then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(3)..' , مالك الكروب }* ',"md",true)  
end
if not Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله مالك مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله مالك ").Reply,"md",true)  
end
end
if TextMsg == "منشئ اساسي" then
if not msg.Ownerss then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(8)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله منشئ اساسي ").Reply,"md",true)  
end
end
if TextMsg == "منشئ" then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(4)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Creator:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من المنشئين مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Creator:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من المنشئين ").Reply,"md",true)  
end
end
if TextMsg == "مدير" then
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(5)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Manger:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من المدراء مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Manger:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من المدراء ").Reply,"md",true)  
end
end
if TextMsg == "ادمن" then
if Redis:sismember(Fast.."Specialall:Group",senderr) then
testmod = true
elseif msg.Manger then
testmod = true
else
testmod = false
end
if testmod == false then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Admin:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من الادمنيه مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Admin:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من الادمنيه ").Reply,"md",true)  
end
end
if TextMsg == "مميز" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(7)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Special:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من المميزين مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Special:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من المميزبن ").Reply,"md",true)  
end
end
if TextMsg == "مرتي" then
if not Redis:sismember(Fast.."kholat:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله   من قائمه زوجاتي سابقا ").Reply,"md",true)  
else
Redis:srem(Fast.."kholat:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من قائمه زوجاتي  ").Reply,"md",true)  
end
end
if TextMsg == "طلي" then
if not Redis:sismember(Fast.."wtka:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من قائمه الطليان سابقا  ").Reply,"md",true)  
else
Redis:srem(Fast.."wtka:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من قائمه الطليان الضاهر بطل يمعي ").Reply,"md",true)  
end
end
if TextMsg == "لوكي" then
if not Redis:sismember(Fast.."twhd:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من قائمه اللوكين سابقا  ").Reply,"md",true)  
else
Redis:srem(Fast.."twhd:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من قائمه اللوكين الضاهر تعالج وبطل يتلوك ").Reply,"md",true)  
end
end
if TextMsg == "عسل" then
if not Redis:sismember(Fast.."twhd:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من قائمه العسل سابقا  ").Reply,"md",true)  
else
Redis:srem(Fast.."twhd:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من قائمه العسل الضاهر طلع خرا ").Reply,"md",true)  
end
end
if TextMsg == "كيك" then
if not Redis:sismember(Fast.."klb:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من قائمه الكيك سابقا ").Reply,"md",true)  
else
Redis:srem(Fast.."klb:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من قائمه الكيك يمكن طلع زربه ").Reply,"md",true)  
end
end
if TextMsg == "مازوخي" then
if not Redis:sismember(Fast.."mar:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من قائمه المازوخيه سابقا ").Reply,"md",true)  
else
Redis:srem(Fast.."mar:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من قائمه المازوخيه يمكن تعالج ").Reply,"md",true)  
end
end
if TextMsg == "غبي" then
if not Redis:sismember(Fast.."smb:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من قائمه الاغبياء سابقا ").Reply,"md",true)  
else
Redis:srem(Fast.."smb:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من قائمه الاغبياء يمكن صار ذكي ").Reply,"md",true)  
end
end
if TextMsg == "زاحف" then
if not Redis:sismember(Fast.."2rd:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من قائمه الزواحف سابقا ").Reply,"md",true)  
else
Redis:srem(Fast.."2rd:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من قائمه الزواحف الظاهر بطل لطلطه ").Reply,"md",true)  
end
end
if TextMsg == "جلب" then
if not Redis:sismember(Fast.."3ra:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من قائمه الحلاب سابقا ").Reply,"md",true)  
else
Redis:srem(Fast.."3ra:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من قائمه الجلاب يمكن بطل ينبح").Reply,"md",true)  
end
end
if TextMsg == "مطي" then
if not Redis:sismember(Fast.."8by:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من قائمه المطايه سابقا ").Reply,"md",true)  
else
Redis:srem(Fast.."8by:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم تنزيله من قائمه المطايه ").Reply,"md",true)  
end
end
end


if text and text:match('^تنزيل (.*) (%d+)$') then
local UserId = {text:match('^تنزيل (.*) (%d+)$')}
local UserInfo = bot.getUser(UserId[2])
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if UserId[1] == 'مطور ثانوي' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(1)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Devss:Groups",UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم تنزيله مطور ثانوي مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Devss:Groups",UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم تنزيله مطور ثانوي").Reply,"md",true)  
end
end
if UserId[1] == 'مطور' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(2)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Dev:Groups",UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم تنزيله مطور مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Dev:Groups",UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم تنزيله مطور ").Reply,"md",true)  
end
end
if UserId[1] == "مالك" then
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Dev then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(3)..' , مالك الكروب }* ',"md",true)  
end
if not Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم تنزيله مالك مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم تنزيله مالك ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ اساسي" then
if not msg.Ownerss then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(8)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم تنزيله منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم تنزيله منشئ اساسي ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ" then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(4)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Creator:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم تنزيله من المنشئين مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Creator:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم تنزيله من المنشئين ").Reply,"md",true)  
end
end
if UserId[1] == "مدير" then
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(5)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Manger:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم تنزيله من المدراء مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Manger:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم تنزيله من المدراء ").Reply,"md",true)  
end
end
if UserId[1] == "ادمن" then
if Redis:sismember(Fast.."Specialall:Group",senderr) then
testmod = true
elseif msg.Manger then
testmod = true
else
testmod = false
end
if testmod == false then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Admin:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم تنزيله من الادمنيه مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Admin:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم تنزيله من الادمنيه ").Reply,"md",true)  
end
end
if UserId[1] == "مميز" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(7)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Special:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم تنزيله من المميزين مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Special:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم تنزيله من المميزين ").Reply,"md",true)  
end
end
end
if text and text:match('^رفع (.*) @(%S+)$') then
local UserName = {text:match('^رفع (.*) @(%S+)$')}
local UserId_Info = bot.searchPublicChat(UserName[2])
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف قناة او ڪروب ","md",true)  
end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if UserName[1] == "مطور ثانوي" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(1)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Devss:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم ترقيته مطور ثانوي مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Devss:Groups",UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم ترقيته مطور ثانوي").Reply,"md",true)  
end
end
if UserName[1] == "مطور" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(2)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Dev:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم ترقيته مطور مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Dev:Groups",UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم ترقيته مطور ").Reply,"md",true)  
end
end
if UserName[1] == "مالك" then
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Dev then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(3)..' , مالك الكروب }* ',"md",true)  
end
if Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم ترقيته مالك مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Ownerss:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم ترقيته مالك ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ اساسي" then
if not msg.Ownerss then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(8)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم ترقيته منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."SuperCreator:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم ترقيته منشئ اساسي ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ" then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(4)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Creator:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم ترقيته منشئ  مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Creator:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم ترقيته منشئ  ").Reply,"md",true)  
end
end
if UserName[1] == "مدير" then
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(5)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Manger:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم ترقيته مدير  مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Manger:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم ترقيته مدير  ").Reply,"md",true)  
end
end
if UserName[1] == "ادمن" then
if Redis:sismember(Fast.."Specialall:Group",senderr) then
testmod = true
elseif msg.Manger then
testmod = true
else
testmod = false
end
if testmod == false then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Creator and not Redis:get(Fast.."Status:SetId"..msg_chat_id) then
return send(msg_chat_id,msg_id,"↯︙ تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(Fast.."Admin:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم ترقيته ادمن  مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Admin:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم ترقيته ادمن  ").Reply,"md",true)  
end
end
if UserName[1] == "مميز" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(7)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Creator and not Redis:get(Fast.."Status:SetId"..msg_chat_id) then
return send(msg_chat_id,msg_id,"↯︙ تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(Fast.."Special:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم ترقيته مميز  مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Special:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"↯︙ تم ترقيته مميز  ").Reply,"md",true)  
end
end
end
if text and text:match("^رفع (.*)$") and msg.reply_to_message_id ~= 0 then
local TextMsg = text:match("^رفع (.*)$")
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if TextMsg == 'مطور ثانوي' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(1)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Devss:Groups",rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم ترقيته مطور ثانوي مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Devss:Groups",rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم ترقيته مطور ثانوي").Reply,"md",true)  
end
end
if TextMsg == 'مطور' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(2)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Dev:Groups",rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم ترقيته مطور مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Dev:Groups",rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم ترقيته مطور ").Reply,"md",true)  
end
end
if TextMsg == "مالك" then
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Dev then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(3)..' , مالك الكروب }* ',"md",true)  
end
if Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم ترقيته مالك مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Ownerss:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم ترقيته مالك ").Reply,"md",true)  
end
end
if TextMsg == "منشئ اساسي" then
if not msg.Ownerss then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(8)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم ترقيته منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."SuperCreator:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم ترقيته منشئ اساسي ").Reply,"md",true)  
end
end
if TextMsg == "منشئ" then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(4)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Creator:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم ترقيته منشئ  مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Creator:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم ترقيته منشئ  ").Reply,"md",true)  
end
end
if TextMsg == "مدير" then
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(5)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Manger:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم ترقيته مدير  مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Manger:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم ترقيته مدير  ").Reply,"md",true)  
end
end
if TextMsg == "ادمن" then
if Redis:sismember(Fast.."Specialall:Group",senderr) then
testmod = true
elseif msg.Manger then
testmod = true
else
testmod = false
end
if testmod == false then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Creator and not Redis:get(Fast.."Status:SetId"..msg_chat_id) then
return send(msg_chat_id,msg_id,"↯︙ تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(Fast.."Admin:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم ترقيته ادمن  مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Admin:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم ترقيته ادمن  ").Reply,"md",true)  
end
end
if TextMsg == "مميز" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(7)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Creator and not Redis:get(Fast.."Status:SetId"..msg_chat_id) then
return send(msg_chat_id,msg_id,"↯︙ تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(Fast.."Special:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم ترقيته مميز  مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Special:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم ترقيته مميز  ").Reply,"md",true)  
end
end
if TextMsg == "مرتي" then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."kholat:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم رفعه  بقائمه زوجاتك سابقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."kholat:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم رفعه    بقائمه زوجاتك الضاهر مرتب امورك").Reply,"md",true)  
end
end
if TextMsg == "طلي" then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."wtka:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم رفعه بقائمه الطليان سابقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."wtka:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم رفعه بقائمه الطليان ").Reply,"md",true)  
end
end
if TextMsg == "لوكي" then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."twhd:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم رفعه بقائمه اللوكيه سابقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."twhd:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم رفعه       بقائمه اللوكيه الظاهر ميبطل لطلطه").Reply,"md",true)  
end
end
if TextMsg == "عسل" then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."twhd:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم رفعه بقائمه العسل سابقا  ").Reply,"md",true)  
else
Redis:sadd(Fast.."twhd:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم رفعه       بقائمه العسل وف شكد حات لعد").Reply,"md",true)  
end
end
if TextMsg == "كيك" then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."klb:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم رفعه بقائمه الـكيك سابقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."klb:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم رفعه     بقائمه الـكيك وف كيك المجموعه  ").Reply,"md",true)  
end
end
if TextMsg == "مازوخي" then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."mar:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم رفعه بقائمه المازوخيه سابقا  ").Reply,"md",true)  
else
Redis:sadd(Fast.."mar:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم رفعه      بقائمه المازوخيه الله يطيح حظك حبي").Reply,"md",true)  
end
end
if TextMsg == "غبي" then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."smb:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم رفعه بقائمه الاغبياء سابقا  ").Reply,"md",true)  
else
Redis:sadd(Fast.."smb:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم رفعه         بقائمه الاغبياء شوكت تصير ادمي وذكي ").Reply,"md",true)  
end
end
if TextMsg == "زاحف" then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."2rd:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم رفعه بقائمه الزواحيف سابقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."2rd:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم رفعه      بقائمه الزواحيف ليا ملطلط ").Reply,"md",true)  
end
end
if TextMsg == "جلب" then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."3ra:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم رفعه بقائمه الجلاب سابقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."3ra:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم رفعه      بقائمه الجلاب يلا انبح حبي").Reply,"md",true)  
end
end
if TextMsg == "مطي" then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."8by:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم رفعه بقائمه المطايه سابقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."8by:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"↯︙ تم رفعه  بقائمه المطايه يلا حبي نطو عربانه وخلي يشتغل").Reply,"md",true)  
end
end
end
if text and text:match('^رفع (.*) (%d+)$') then
local UserId = {text:match('^رفع (.*) (%d+)$')}
local UserInfo = bot.getUser(UserId[2])
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if UserId[1] == 'مطور ثانوي' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(1)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Devss:Groups",UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم ترقيته مطور ثانوي مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Devss:Groups",UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم ترقيته مطور ثانوي").Reply,"md",true)  
end
end
if UserId[1] == 'مطور' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(2)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Dev:Groups",UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم ترقيته مطور مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Dev:Groups",UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم ترقيته مطور ").Reply,"md",true)  
end
end
if UserId[1] == "مالك" then
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Dev then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(3)..' , مالك الكروب }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم ترقيته مالك مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Ownerss:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم ترقيته مالك ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ اساسي" then
if not msg.Ownerss then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(8)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم ترقيته منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."SuperCreator:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم ترقيته منشئ اساسي ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ" then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(4)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Creator:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم ترقيته منشئ  مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Creator:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم ترقيته منشئ  ").Reply,"md",true)  
end
end
if UserId[1] == "مدير" then
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(5)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Manger:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم ترقيته مدير  مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Manger:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم ترقيته مدير  ").Reply,"md",true)  
end
end
if UserId[1] == "ادمن" then
if Redis:sismember(Fast.."Specialall:Group",senderr) then
testmod = true
elseif msg.Manger then
testmod = true
else
testmod = false
end
if testmod == false then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Creator and not Redis:get(Fast.."Status:SetId"..msg_chat_id) then
return send(msg_chat_id,msg_id,"↯︙ تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(Fast.."Admin:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم ترقيته ادمن  مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Admin:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم ترقيته ادمن  ").Reply,"md",true)  
end
end
if UserId[1] == "مميز" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(7)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Creator and not Redis:get(Fast.."Status:SetId"..msg_chat_id) then
return send(msg_chat_id,msg_id,"↯︙ تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(Fast.."Special:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم ترقيته مميز  مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Special:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2],"↯︙ تم ترقيته مميز  ").Reply,"md",true)  
end
end
end
if text and text:match("^تغيير رد المطور (.*)$") then
local Teext = text:match("^تغيير رد المطور (.*)$") 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
Redis:set(Fast.."Developer:Bot:Reply"..msg.chat_id,Teext)
return send(msg_chat_id,msg_id,"↯︙ تم تغيير رد المطور الى :"..Teext)
elseif text and text:match("^تغيير رد المالك (.*)$") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
local Teext = text:match("^تغيير رد المالك (.*)$") 
Redis:set(Fast.."PresidentQ:Group:Reply"..msg.chat_id,Teext)
return send(msg_chat_id,msg_id,"↯︙ تم تغيير رد المالك الى :"..Teext)
elseif text and text:match("^تغيير رد المنشئ الاساسي (.*)$") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
local Teext = text:match("^تغيير رد المنشئ الاساسي (.*)$") 
Redis:set(Fast.."President:Group:Reply"..msg.chat_id,Teext)
return send(msg_chat_id,msg_id,"↯︙ تم تغيير رد المنشئ الاساسي الى :"..Teext)
elseif text and text:match("^تغيير رد المنشئ (.*)$") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
local Teext = text:match("^تغيير رد المنشئ (.*)$") 
Redis:set(Fast.."Constructor:Group:Reply"..msg.chat_id,Teext)
return send(msg_chat_id,msg_id,"↯︙ تم تغيير رد المنشئ الى :"..Teext)
elseif text and text:match("^تغيير رد المدير (.*)$") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
local Teext = text:match("^تغيير رد المدير (.*)$") 
Redis:set(Fast.."Manager:Group:Reply"..msg.chat_id,Teext) 
return send(msg_chat_id,msg_id,"↯︙ تم تغيير رد المدير الى :"..Teext)
elseif text and text:match("^تغيير رد الادمن (.*)$") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
local Teext = text:match("^تغيير رد الادمن (.*)$") 
Redis:set(Fast.."Admin:Group:Reply"..msg.chat_id,Teext)
return send(msg_chat_id,msg_id,"↯︙ تم تغيير رد الادمن الى :"..Teext)
elseif text and text:match("^تغيير رد المميز (.*)$") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
local Teext = text:match("^تغيير رد المميز (.*)$") 
Redis:set(Fast.."Vip:Group:Reply"..msg.chat_id,Teext)
return send(msg_chat_id,msg_id,"↯︙ تم تغيير رد المميز الى :"..Teext)
elseif text and text:match("^تغيير رد العضو (.*)$") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
local Teext = text:match("^تغيير رد العضو (.*)$") 
Redis:set(Fast.."Mempar:Group:Reply"..msg.chat_id,Teext)
return send(msg_chat_id,msg_id,"↯︙ تم تغيير رد العضو الى :"..Teext)
elseif text == 'مسح رد المطور' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
Redis:del(Fast.."Developer:Bot:Reply"..msg.chat_id)
return send(msg_chat_id,msg_id,"↯︙ تم حدف رد المطور")
elseif text == 'مسح رد المنشئ الاساسي' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
Redis:del(Fast.."President:Group:Reply"..msg.chat_id)
return send(msg_chat_id,msg_id,"↯︙ تم مسح رد المنشئ الاساسي ")
elseif text == 'مسح رد المالك' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
Redis:del(Fast.."PresidentQ:Group:Reply"..msg.chat_id)
return send(msg_chat_id,msg_id,"↯︙ تم مسح رد المالك ")
elseif text == 'مسح رد المنشئ' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
Redis:del(Fast.."Constructor:Group:Reply"..msg.chat_id)
return send(msg_chat_id,msg_id,"↯︙ تم مسح رد المنشئ ")
elseif text == 'مسح رد المدير' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
Redis:del(Fast.."Manager:Group:Reply"..msg.chat_id) 
return send(msg_chat_id,msg_id,"↯︙ تم مسح رد المدير ")
elseif text == 'مسح رد الادمن' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
Redis:del(Fast.."Admin:Group:Reply"..msg.chat_id)
return send(msg_chat_id,msg_id,"↯︙ تم مسح رد الادمن ")
elseif text == 'مسح رد المميز' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
Redis:del(Fast.."Vip:Group:Reply"..msg.chat_id)
return send(msg_chat_id,msg_id,"↯︙ تم مسح رد المميز")
elseif text == 'مسح رد العضو' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
Redis:del(Fast.."Mempar:Group:Reply"..msg.chat_id)
return send(msg_chat_id,msg_id,"↯︙ تم مسح رد العضو")
end 
if text and text:match('^ضع رتبه @(%S+) (.*)$') and not Redis:get(Fast..'Redis:setRt'..msg.chat_id) then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(7)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local UserName = {text:match('^ضع رتبه @(%S+) (.*)$')}
local UserId_Info = bot.searchPublicChat(UserName[1])
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف قناة او ڪروب ","md",true)  
end
if UserName[1] and UserName[1]:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
Redis:set(Fast..'SetRt'..msg_chat_id..':'..UserId_Info.id,UserName[2])
return send(msg_chat_id,msg_id,"\n↯︙ تم وضع رتبه له : "..UserName[2],"md",true)  
end
if text and text:match('^ضع رتبه (.*)$') and msg.reply_to_message_id ~= 0 and not Redis:get(Fast..'Redis:setRt'..msg.chat_id) then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(7)..'  ⦘* ',"md",true)  
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
Redis:set(Fast..'SetRt'..msg_chat_id..':'..rep_idd,text:match('^ضع رتبه (.*)$'))
return send(msg_chat_id,msg_id,"\n↯︙ تم وضع رتبه له : "..text:match('^ضع رتبه (.*)$'),"md",true)  
end
if text and text:match('^مسح رتبه @(%S+)$') and not Redis:get(Fast..'Redis:setRt'..msg.chat_id) then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(7)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local UserName = text:match('^مسح رتبه @(%S+)$')
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف قناة او ڪروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n↯︙ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
Redis:del(Fast..'SetRt'..msg_chat_id..':'..UserId_Info.id)
return send(msg_chat_id,msg_id,"\n↯︙ تم مسح رتبه  التي وضعتها","md",true)  
end
if text and text:match('^مسح رتبه$') and msg.reply_to_message_id ~= 0 and not Redis:get(Fast..'Redis:setRt'..msg.chat_id) then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(7)..'  ⦘* ',"md",true)  
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
Redis:del(Fast..'SetRt'..msg_chat_id..':'..rep_idd)
return send(msg_chat_id,msg_id,"\n↯︙ تم مسح رتبه التي وضعتها ","md",true)  
end

if text == "تعطيل ضع رتبه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(5)..'  ⦘* ',"md",true)  
end
if Redis:get(Fast..'Redis:setRt'..msg.chat_id)  then
send(msg_chat_id,msg_id, '↯︙ تم تعطيل امر وضع الرتبه مسبقا\n ✓',"md")
else
Redis:set(Fast.."Redis:setRt"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '↯︙ تم تعطيل امر وضع الرتبه \n ✓',"md")
end
end
if text == "تفعيل ضع رتبه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(5)..'  ⦘* ',"md",true)  
end
if not Redis:get(Fast..'Redis:setRt'..msg.chat_id)  then
send(msg_chat_id,msg_id, '↯︙ تم تفعيل امر وضع الرتبه مسبقا\n ✓',"md")
else
Redis:del(Fast.."Redis:setRt"..msg.chat_id)
send(msg_chat_id,msg_id, '↯︙ تم تفعيل امر وضع الرتبه \n ✓',"md")
end
end


if text == 'تاك للكل' and (Redis:get(Fast..'tagallgroup'..msg.chat_id) == "open") then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(7)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end

local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
local UserInfo = bot.getUser(v.member_id.user_id)
if FlterBio(UserInfo.first_name) ~= "" then
if UserInfo.username then
Creator = "*↯︙ مالك الكروب : @"..UserInfo.username.."*\n"
else
Creator = "↯︙ مالك الكروب : *["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserInfo.id..")\n"
end
send(msg_chat_id,msg_id,Creator,"md",true)  
end
end
end

local Info_Members = Redis:smembers(Fast.."Ownerss:Group"..msg_chat_id) 
if #Info_Members ~= 0 then
local ListMembers = '\n*↯︙ قائمه المالكين \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
send(msg_chat_id, msg_id, ListMembers, 'md')
end
local Info_Members = Redis:smembers(Fast.."SuperCreator:Group"..msg_chat_id) 
if #Info_Members ~= 0 then
local ListMembers = '\n*↯︙ قائمه المنشئين الاساسيين \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
send(msg_chat_id, msg_id, ListMembers, 'md')
end
local Info_Members = Redis:smembers(Fast.."Creator:Group"..msg_chat_id) 
if #Info_Members ~= 0 then
local ListMembers = '\n*↯︙ قائمه المنشئين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
send(msg_chat_id, msg_id, ListMembers, 'md')
end
local Info_Members = Redis:smembers(Fast.."Manger:Group"..msg_chat_id) 
if #Info_Members ~= 0 then
local ListMembers = '\n*↯︙ قائمه المدراء  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
send(msg_chat_id, msg_id, ListMembers, 'md')
end
local Info_Members = Redis:smembers(Fast.."Admin:Group"..msg_chat_id) 
if #Info_Members ~= 0 then
local ListMembers = '\n*↯︙ قائمه الادمنيه  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
send(msg_chat_id, msg_id, ListMembers, 'md')
end
local Info_Members = Redis:smembers(Fast.."Special:Group"..msg_chat_id) 
if #Info_Members ~= 0 then
local ListMembers = '\n*↯︙ قائمه المميزين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
send(msg_chat_id, msg_id, ListMembers, 'md')
end
local Info_Members = bot.searchChatMembers(msg_chat_id, "*", 200)
local List_Members = Info_Members.members
listall = '\n*↯︙ قائمه الاعضاء \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(List_Members) do
local UserInfo = bot.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
listall = listall.."*"..k.." - @"..UserInfo.username.."*\n"
else
listall = listall.."*"..k.." -* ["..UserInfo.id.."](tg://user?id="..UserInfo.id..")\n"
end
end
send(msg_chat_id,msg_id,listall,"md",true)  
end

if text == 'المطورين الثانويين' or text == 'المطورين الثانوين' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(1)..'  ⦘* ',"md",true)  
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
ListMembers = '\n*↯︙ قائمه مطورين الثانويين \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
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
data = {{{text = '- مسح المطورين الثانويين', data = senderr..'/Devss'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المطورين' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(2)..'  ⦘* ',"md",true)  
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
if text == 'المالكين' then
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Creator then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(5)..' , مالك الكروب }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Ownerss:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لا يوجد منشئين اساسيين حاليا , ","md",true)  
end
ListMembers = '\n*↯︙ قائمه المالكين \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
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
data = {{{text = '- مسح المالكين', data = senderr..'/Ownerss'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md')
end
if text == 'المنشئين الاساسيين' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(7)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."SuperCreator:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لا يوجد منشئين اساسيين حاليا , ","md",true)  
end
ListMembers = '\n*↯︙ قائمه المنشئين الاساسيين \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
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
data = {{{text = '- مسح المنشئين الاساسيين', data = senderr..'/SuperCreator'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md')
end
if text == 'المنشئين' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(7)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Creator:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لا يوجد منشئين حاليا , ","md",true)  
end
ListMembers = '\n*↯︙ قائمه المنشئين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
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
data = {{{text = '- مسح المنشئين', data = senderr..'/Creator'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md')
end
if text == 'المدراء' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(7)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Manger:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لا يوجد مدراء حاليا , ","md",true)  
end
ListMembers = '\n*↯︙ قائمه المدراء  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
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
data = {{{text = '- مسح المدراء', data = senderr..'/Manger'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md')
end
if text == 'الادمنيه' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(7)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Admin:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لا يوجد ادمنيه حاليا , ","md",true)  
end
ListMembers = '\n*↯︙ قائمه الادمنيه  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
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
data = {{{text = '- مسح الادمنيه', data = senderr..'/Admin'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md')
end
if text == 'المميزين' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(7)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Special:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لا يوجد مميزين حاليا , ","md",true)  
end
ListMembers = '\n*↯︙ قائمه المميزين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
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
data = {{{text = '- مسح المميزين', data = senderr..'/DelSpecial'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md')
end
if text == 'الطامسين' then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."kholat:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لا يوجد طامسين حاليا , ","md",true)  
end
ListMembers = '\n*↯︙ قائمه الطامسين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
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
data = {{{text = '- مسح الطامسين', data = senderr..'/Delkholat'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المطايه' then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."wtka:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لا يوجد مطايه بالكروب حاليا  , ","md",true)  
end
ListMembers = '\n*↯︙ قائمه المطايه  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
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
data = {{{text = '- مسح المطايه', data = senderr..'/Delwtk'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'العسل' then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."twhd:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لايوجد احد بقائمه العسل, ","md",true)  
end
ListMembers = '\n*↯︙ قائمه العسل  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
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
data = {{{text = '- مسح العسل', data = senderr..'/Deltwhd'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'الكيك' then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."klb:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لايوجد احد بقائمه الكيك حاليا, ","md",true)  
end
ListMembers = '\n*↯︙ قائمه الكيك  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
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
data = {{{text = '- مسح الكيك', data = senderr..'/Delklb'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المازوخين' then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."mar:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لايوجد مازوخيين حاليا , ","md",true)  
end
ListMembers = '\n*↯︙ قائمه المازوخيين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
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
data = {{{text = '- مسح المازوخيين', data = senderr..'/Delmar'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'الجلاب' then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."3ra:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لايوجد جلاب حاليا , ","md",true)  
end
ListMembers = '\n*↯︙ قائمه الجلاب  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
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
data = {{{text = '- مسح الجلاب', data = senderr..'/Del3ra'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'الاغبياء' then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."smb:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لايوجد اغبياء حاليا , ","md",true)  
end
ListMembers = '\n*↯︙ قائمه الاغبياء  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
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
data = {{{text = '- مسح الاغبياء', data = senderr..'/Delsmb'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'الزواحيف' then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."2rd:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لايوجد زواحيف حاليا , ","md",true)  
end
ListMembers = '\n*↯︙ قائمه الزواحيف  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
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
data = {{{text = '- مسح الزواحيف', data = senderr..'/Del2rd'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المطايه' then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."8by:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لايوجد مطايه حاليا , ","md",true)  
end
ListMembers = '\n*↯︙ قائمه المطايه  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
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
data = {{{text = '- مسح المطايه', data = senderr..'/Del8by'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المحظورين عام' or text == 'قائمه العام' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(7)..'  ⦘* ',"md",true)  
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
if text == 'المحظورين' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(7)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."BanGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لا يوجد محظورين حاليا , ","md",true)  
end
ListMembers = '\n*↯︙ قائمه المحظورين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
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
data = {{{text = '- مسح المحظورين', data = senderr..'/BanGroup'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المكتومين' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(7)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."SilentGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"↯︙ لا يوجد مكتومين حاليا , ","md",true)  
end
ListMembers = '\n*↯︙ قائمه المكتومين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
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
data = {{{text = '- مسح المكتومين', data = senderr..'/SilentGroupGroup'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text and text:match("^تفعيل (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^تفعيل (.*)$")
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(7)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if TextMsg == 'الرابط' then
Redis:set(Fast.."Status:Link"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"↯︙ تم تفعيل الرابط ","md",true)
end
if TextMsg == 'الترحيب' then
Redis:set(Fast.."Status:Welcome"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"↯︙ تم تفعيل الترحيب ","md",true)
end
if TextMsg == 'الايدي' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Status:Id"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"↯︙ تم تفعيل الايدي ","md",true)
end
if TextMsg == 'الايدي بالصوره' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Status:IdPhoto"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"↯︙ تم تفعيل الايدي بالصوره ","md",true)
end
if TextMsg == 'الردود' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(6)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Status:Reply"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"↯︙ تم تفعيل الردود ","md",true)
end
if TextMsg == 'الردود العامه' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(5)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Status:ReplySudo"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"↯︙ تم تفعيل الردود العامه ","md",true)
end
if TextMsg == 'الحظر' or TextMsg == 'الطرد' or TextMsg == 'التقييد' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(5)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Status:BanId"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"↯︙ تم تفعيل الحظر , الطرد , التقييد","md",true)
end
if TextMsg == 'الرفع' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(5)..'  ⦘* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Status:SetId"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"↯︙ تم تفعيل الرفع ","md",true)
end
if TextMsg == 'الالعاب' then
Redis:set(Fast.."Status:Games"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"↯︙ تم تفعيل الالعاب ","md",true)
end
if TextMsg == 'اطردني' then
Redis:set(Fast.."Status:KickMe"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"↯︙ تم تفعيل اطردني ","md",true)
end
if TextMsg == 'البوت الخدمي' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(1)..'  ⦘* ',"md",true)  
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
if TextMsg == 'التواصل' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص ⦗  '..Controller_Num(1)..'  ⦘* ',"md",true)  
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

end

if text == 'رتبتي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
return send(msg_chat_id,msg_id,'\n↯︙ رتبتك هي : '..(Redis:get(Fast..':SetRt'..msg.chat_id..':'..msg.sender_id.user_id) or msg.Name_Controller),"md",true)  
end
if text == 'معلوماتي' or text == 'موقعي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local UserInfo = bot.getUser(senderr)
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
StatusMemberChat = 'مالك الكروب'
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'مشرف الكروب'
else
StatusMemberChat = 'عضو في الكروب'
end
local UserId = senderr
local RinkBot = Redis:get(Fast..':SetRt'..msg.chat_id..':'..UserId) or msg.Name_Controller
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..senderr) or 0
local TotalMsgT = Total_message(TotalMsg) 
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
if StatusMemberChat == 'مشرف الكروب' then 
local GetMemberStatus = bot.getChatMember(msg_chat_id,senderr).status
if GetMemberStatus.can_change_info then
change_info = '⦗ ✓ ⦘' else change_info = '⦗ ✕ ⦘'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '⦗ ✓ ⦘' else delete_messages = '⦗ ✕ ⦘'
end
if GetMemberStatus.can_invite_users then
invite_users = '⦗ ✓ ⦘' else invite_users = '⦗ ✕ ⦘'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '⦗ ✓ ⦘' else pin_messages = '⦗ ✕ ⦘'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '⦗ ✓ ⦘' else restrict_members = '⦗ ✕ ⦘'
end
if GetMemberStatus.can_promote_members then
promote = '⦗ ✓ ⦘' else promote = '⦗ ✕ ⦘'
end
PermissionsUser = '*\n↯︙ صلاحيات المستخدم :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..'\n↯︙ تغيير المعلومات : '..change_info..'\n↯︙ تثبيت الرسائل : '..pin_messages..'\n↯︙ اضافه مستخدمين : '..invite_users..'\n↯︙ مسح الرسائل : '..delete_messages..'\n↯︙ حظر المستخدمين : '..restrict_members..'\n↯︙ اضافه المشرفين : '..promote..'\n\n*'
end
return send(msg_chat_id,msg_id,
'\n*↯︙ ايديك : '..UserId..
'\n↯︙ معرفك : '..UserInfousername..
'\n↯︙ رتبتك : '..RinkBot..
'\n↯︙ رتبته الكروب: '..StatusMemberChat..
'\n↯︙ رسائلك : '..TotalMsg..
'\n↯︙ تعديلاتك : '..TotalEdit..
'\n↯︙ تفاعلك : '..TotalMsgT..
'*'..(PermissionsUser or '') ,"md",true) 
end
if text == 'لقبي' then
local StatusMember = bot.getChatMember(msg_chat_id,senderr)
if StatusMember.status.custom_title ~= "" then
Lakb = StatusMember.status.custom_title
else
Lakb = 'مشرف'
end
if (StatusMember.status.Fastbots == "chatMemberStatusCreator") then
return send(msg_chat_id,msg_id,'\n*↯︙ لقبك ⦗  '..Lakb..'  ⦘* ',"md",true)  
elseif (StatusMember.status.Fastbots == "chatMemberStatusAdministrator") then
return send(msg_chat_id,msg_id,'\n*↯︙ لقبك ⦗  '..Lakb..'  ⦘* ',"md",true)  
else
return send(msg_chat_id,msg_id,'\n*↯︙ انت عضو في الكروب* ',"md",true)  
end
end


end
return {Fast = setrtb}