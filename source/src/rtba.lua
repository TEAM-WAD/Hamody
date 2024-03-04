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