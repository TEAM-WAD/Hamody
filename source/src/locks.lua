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

if text and text:match("^تعطيل (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^تعطيل (.*)$")
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