--[[
~> DEV JABWA ⇿ @JABWA
]] 
function Fast_Fun(msg)
text = nil
if msg and msg.content and msg.content.text then
text = msg.content.text.text
end
msg_chat_id = msg.chat_id
msg_id = msg.id
if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text)
if neww then
text = neww or text
end
end



if text == 'الربنلوليت' then
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

if text == "لتات الحب" or text == "انتل حب" and msg.reply_to_message_id ~= 0 then
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
hggg = 'ارسل اسم الشخص الذي تريد قياس لينبنان الحب\n مثال قيصر ومصطفى'
send(msg_chat_id,msg_id,hggg) 
return false
end
end
if text == "لينبنان الغباء" or text == "لينبنان الغباء" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":lov_Bottts"..msg.chat_id,"sendlove")
hggg = '↯︙ الان ارسل اسم الشخص '
send(msg_chat_id,msg_id,hggg) 
return false
end
end
if text == "لينبنان الذكاء" or text == "لينبنان الذكاء" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":lov_Botttuus"..msg.chat_id,"sendlove")
hggg = '↯︙ الان ارسل اسم الشخص '
send(msg_chat_id,msg_id,hggg) 
return false
end
end
if text == "لينبنان الكره" or text == "لينبنان كره" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":krh_Bots"..msg.chat_id,"sendkrhe")
hggg = 'ارسل اسم الشخص الذي تريد قياس لينبنان الكره\n مثال قيصر ومصطفى'
send(msg_chat_id,msg_id,hggg) 
return false
end
end
if text == "لينبنان الرجوله" or text == "لينبنان الرجوله" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":rjo_Bots"..msg.chat_id,"sendrjoe")
hggg = '↯︙ الان ارسل اسم الشخص '
send(msg_chat_id,msg_id,hggg) 
return false
end
end
if text == "لينبنان الانوثه" or text == "لينبنان انوثه" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":ano_Bots"..msg.chat_id,"sendanoe")
hggg = '↯︙ الان ارسل اسم الشخص '
send(msg_chat_id,msg_id,hggg) 
return false
end
end
if text == "تفعيل شعر" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*\n↯︙هذا الامر يخص { '..Controller_Num(6)..' }*',"md",true)  
end
local JABWA = ' \n↯︙تم تفعيل شعر'
send(msg_chat_id,msg_id,JABWA,"md")
Redis:del(Fast..'sh3ir:Abs'..msg.chat_id) 
end
if text == "تعطيل شعر" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*\n↯︙ هذا الامر يخص { '..Controller_Num(6)..' }*',"md",true)  
end
local JABWA = ' \n↯︙ تم تعطيل شعر'
send(msg_chat_id,msg_id,JABWA,"md")
Redis:set(Fast..'sh3ir:Abs'..msg.chat_id,true)  
end
if text and (text == "شعر" or text == "↫ شعر ✯") and not Redis:get(Fast..'sh3ir:Abs'..msg.chat_id) then
Abs = math.random(2,140); 
local Text ='*↯︙ تم اختيار الشعر لك فقط*'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '- 𝖳𝖾𝖺𝗆 𝖡𝖱𝗈k𝖲. ',url="t.me/"..chsource..""}},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/L1BBBL/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "زلنو" or text == "اقتلو" or text == "تخ تخ" then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local ban = bot.getUser(Message_Reply.sender_id.user_id)
local bain = bot.getUser(senderr)
if tonumber(Message_Reply.sender_id.user_id) == tonumber(senderr) then
return bot.sendText(msg_chat_id,msg_id,"*لول عوز يقتل نفسه العبيط 😹*","md",true)  
end
if tonumber(Message_Reply.sender_id.user_id) == tonumber(5876056887) then
return bot.sendText(msg_chat_id,msg_id,"*لا استطيع استخدام الأمر علي قيصر بيه*","md",true)  
end
if tonumber(Message_Reply.sender_id.user_id) == tonumber(Fast) then
return bot.sendText(msg_chat_id,msg_id,"*لا استخدم الأمر علي نفسي يستا 😂*","md",true)  
end
if ban.first_name then
Text = '*قتل ⇿* ['..bain.first_name..'](tg://user?id='..bain.id..')\n*المجرم دا 😢 ⇿* ['..ban.first_name..'](tg://user?id='..ban.id..')\n*انـا لله وانـا اليـه راجعـون 😢\n*'
else
Text = 'لا يوجد'
end
 keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'المقتول 🔪', url = "https://t.me/"..ban.username..""},
},
}
local msgg = msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token.."/sendvideo?chat_id=" .. msg_chat_id .. "&video=https://t.me/DEV_JABWA/176&caption=".. URL.escape(Text).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "تفي" or text == "تفو" or text == "تف تف" then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local ban = bot.getUser(Message_Reply.sender_id.user_id)
local bain = bot.getUser(senderr)
if tonumber(Message_Reply.sender_id.user_id) == tonumber(senderr) then
return bot.sendText(msg_chat_id,msg_id,"*  تريد تتفل ع نفسك شو تستغبي؟ *","md",true)  
end
if tonumber(Message_Reply.sender_id.user_id) == tonumber(5876056887) then
return bot.sendText(msg_chat_id,msg_id,"*لا استطيع استخدام الأمر على  تاجراسك*","md",true)  
end
if tonumber(Message_Reply.sender_id.user_id) == tonumber(Fast) then
return bot.sendText(msg_chat_id,msg_id,"*لا استخدم الأمر على نفسي ياغبي *","md",true)  
end
if ban.first_name then
Text = '*المستخدم التافل * ['..bain.first_name..'](tg://user?id='..bain.id..')\n*  المستخدم المتفول عليه  * ['..ban.first_name..'](tg://user?id='..ban.id..')\n*   نجب يلا\n*'
else
Text = 'لا يوجد'
end
 keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '  حصل تفله حيتوب', url = "https://t.me/"..ban.username..""},
},
}
local msgg = msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token.."/sendvideo?chat_id=" .. msg_chat_id .. "&video=https://t.me/DEV_JABWA/175&caption=".. URL.escape(Text).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "مح" or text == "بوسه" or text == "مح فبؤقك" then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local ban = bot.getUser(Message_Reply.sender_id.user_id)
local bain = bot.getUser(senderr)
if tonumber(Message_Reply.sender_id.user_id) == tonumber(senderr) then
return bot.sendText(msg_chat_id,msg_id,"*اععع تريد تبوس نفسك *","md",true)  
end
if tonumber(Message_Reply.sender_id.user_id) == tonumber(5876056887) then
return bot.sendText(msg_chat_id,msg_id,"*لا استطيع استخدام الأمر علي قيصر بيه*","md",true)  
end
if tonumber(Message_Reply.sender_id.user_id) == tonumber(Fast) then
return bot.sendText(msg_chat_id,msg_id,"*لا استخدم الأمر علي نفسي ياغبي *","md",true)  
end
if ban.first_name then
Text = '*💞 القميل * ['..bain.first_name..'](tg://user?id='..bain.id..')\n* دزلك بوسه * ['..ban.first_name..'](tg://user?id='..ban.id..')\n*↯︙ تم القبله بنجاح 🥺♥\n*'
else
Text = 'لا يوجد'
end
 keyboard = {} 
keyboard.inline_keyboard = {
{
{text = ' - الي نطيته الحلك', url = "https://t.me/"..ban.username..""},
},
}
local msgg = msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token.."/sendvideo?chat_id=" .. msg_chat_id .. "&video=https://t.me/DEV_JABWA/199&caption=".. URL.escape(Text).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "نداء" or text == "صيح" then
local Info_Chats = bot.getSupergroupFullInfo(msg.chat_id)
local chat_Members = bot.searchChatMembers(msg_chat_id, "*", Info_Chats.member_count).members
local rand_members = math.random(#chat_Members)
local member_id = chat_Members[rand_members].member_id.user_id
local member_name = bot.getUser(chat_Members[rand_members].member_id.user_id).first_name
local Mostafa = "["..member_name.."](tg://user?id="..member_id..")"
local JABWA = {"وينك يا برو صديقك يحتاجك 💕.","• يـا قمـري ❤️‍🔥","اخي شلون م تحكي معنا 🤔.","وينك كلبي صديقك يحتاجك 💗.","منورنا يقمر 🌚🤍","• يـا قمـري ❤️‍🔥","لينا ساعه نطرينك اخي 😾."}
local Text = JABWA[math.random(#JABWA)]
return bot.sendText(msg_chat_id,msg_id,"* "..Text.." *\n "..Mostafa.." ","md",true)
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
return send(msg_chat_id,msg_id,'↯︙ تم تعطيل التسليه مسبقا\n√',"md")
else
Redis:set(Fast.."amrthshesh"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,'↯︙ تم تعطيل التسليه\n√',"md")
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
return send(msg_chat_id,msg_id,'↯︙ تم تفعيل التسليه مسبقا\n√',"md")
else
Redis:del(Fast.."amrthshesh"..msg.chat_id)
return send(msg_chat_id,msg_id,'↯︙ تم تفعيل التسليه\n√',"md")
end
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
send(msg_chat_id,msg_id, '↯︙ تم تعطيل اوامر الصيغ مسبقا\n√',"md")
else
Redis:set(Fast.."kadmeat"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '↯︙ تم تعطيل اوامر الصيغ\n√',"md")
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
send(msg_chat_id,msg_id, '↯︙ تم تفعيل اوامر التحويلات مسبقا\n√',"md")
else
Redis:del(Fast.."kadmeat"..msg.chat_id)
send(msg_chat_id,msg_id, '↯︙ تم تفعيل اوامر الصيغ\n√',"md")
end
end
if text == "تعطيل تبنامتة" then
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
send(msg_chat_id,msg_id, '↯︙ تم تعطيل امر انطق مسبقا\n√',"md")
else
Redis:set(Fast.."intg"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '↯︙ تم تعطيل امر انطق\n√',"md")
end
end
if text == "تتناز انطق" then
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
send(msg_chat_id,msg_id, '↯︙ تم تفعيل امر انطق مسبقا\n√',"md")
else
Redis:del(Fast.."intg"..msg.chat_id)
send(msg_chat_id,msg_id, '↯︙ تم تفعيل امر انطق\n√',"md")
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
send(msg_chat_id,msg_id, '↯︙ تم تعطيل امر غنيلي مسبقا\n√',"md")
else
Redis:set(Fast.."knele"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '↯︙ تم تعطيل امر غنيلي\n√',"md")
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
send(msg_chat_id,msg_id, '↯︙ تم تفعيل امر غنيلي مسبقا\n√',"md")
else
Redis:del(Fast.."knele"..msg.chat_id)
send(msg_chat_id,msg_id, '↯︙ تم تفعيل امر غنيلي\n√',"md")
end
end

if text == "غنيلي" or text == "غني" then 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."knele"..msg.chat_id) then
Abs = math.random(2,140); 
local Text ='*↯︙ تم اختيار الاغنيه لك*'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '- 𝖳𝖾𝖺𝗆 𝖡𝖱𝗈k𝖲. ',url='http://t.me/'..chsource..''}},
}
local MsgId = msg.id/2097152/0.5
local MSGID = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/XX_kato/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..MSGID.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
end
if text and text:match("^معنى (.*)$") then 
local TextMean = text:match("^معنى (.*)$") or text:match("^معنى اسم (.*)$") 
if not Redis:get(Fast..'mynames'..msg.chat_id)  then
UrlMean = io.popen('curl -s "https://life-its-good.tk/m3aniasmaaip/m3aneip.php?Name='..URL.escape(TextMean)..'"'):read('*a')
Mean = JSON.decode(UrlMean) 
send(msg_chat_id,msg_id, Mean.ok.abs)
end
end
if text == "تلنانز قول" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'kolklma'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'↯︙ تم تعطيل قول مسبقا\n√',"md")
else
Redis:del(Fast.."kolklma"..msg.chat_id)
return send(msg_chat_id,msg_id,'↯︙ تم تعطيل قول\n√',"md")
end
end
if text == "نانازمز قول" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'kolklma'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'↯︙ تم تفعيل قول مسبقا\n√',"md")
else
Redis:set(Fast.."kolklma"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,'↯︙ تم تفعيل قول\n√',"md")
end
end
if text and text:match("^لنلةظا (.*)$") and Redis:get(Fast..'kolklma'..msg.chat_id) then
local txt = {string.match(text, "^(تلناات) (.*)$")}
return send(msg_chat_id,msg_id, txt[2], 'html')
end
if text and text:match("^ذكاء (.*)$") then
local TextName = text:match("^ذكاء (.*)$")
local gptchatt = request("https://www.hmss.store/api/chat.php/index.php?text="..URL.escape(TextName))
send(msg_chat_id,msg_id,gptchatt,"md",true)
end
if text == "تعطيل اغنيه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'myniknea'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'↯︙ تم تعطيل اغنيه مسبقا\n√',"md")
else
Redis:set(Fast.."myniknea"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,'↯︙ تم تعطيل اغنيه\n√',"md")
end
end
if text == "تفعيل اغنيه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*↯︙ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'myniknea'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'↯︙ تم تفعيل اغنيه مسبقا\n√',"md")
else
Redis:del(Fast.."myniknea"..msg.chat_id)
return send(msg_chat_id,msg_id,'↯︙ تم تفعيل اغنيه\n√',"md")
end
end
if text == "تفعيل لينبنان جمالي" or text == "تفعيل جمالي" then
if not msg.Admin then
send(msg_chat_id,msg_id,'*\n ↯︙ هذا الامر يخص 〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
Redis:del(Fast.."mybuti"..msg_chat_id)
send(msg_chat_id,msg_id,'*\n ↯︙ تم تفعيل امر جمالي *',"md",true)  
end
if text == "تعطيل جمالي" or text == "تعطيل لينبنان جمالي" then
if not msg.Admin then
send(msg_chat_id,msg_id,'*\n ↯︙ هذا الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
Redis:set(Fast.."mybuti"..msg_chat_id,"off")
send(msg_chat_id,msg_id,'*\n ↯︙ تم تعطيل امر جمالي *',"md",true)  
end
if text == "تفعيل شخصيه" or text == "تفعيل شخصيتي" then
if not msg.Admin then
send(msg_chat_id,msg_id,'*\n ↯︙ هذا الامر يخص〘  '..Controller_Num(7)..' 〙*',"md",true)  
end
Redis:del(Fast.."shakse"..msg_chat_id)
send(msg_chat_id,msg_id,'*\n ↯︙ تم تفعيل امر شخصيتي *',"md",true)  
end
if text == "تعطيل شخصيتي" or text == "تعطيل شخصيه" then
if not msg.Admin then
send(msg_chat_id,msg_id,'*\n ↯︙ هذا الامر يخص〘  '..Controller_Num(7)..' 〙*',"md",true)  
end
Redis:set(Fast.."shakse"..msg_chat_id,"off")
send(msg_chat_id,msg_id,'*\n ↯︙ تم تعطيل امر شخصيتي *',"md",true)  
end
if text == "تفعيل شبيهي" or text == "تفعيل شبيه" then
if not msg.Admin then
send(msg_chat_id,msg_id,'*\n ↯︙ هذا الامر يخص〘  '..Controller_Num(7)..' 〙*',"md",true)  
end
Redis:del(Fast.."likweme"..msg_chat_id)
send(msg_chat_id,msg_id,'*\n ↯︙ تم تفعيل امر شبيهي *',"md",true)  
end
if text == "تعطيل شبيهي" or text == "تعطيل شبيه" then
if not msg.Admin then
send(msg_chat_id,msg_id,'*\n ↯︙ هذا الامر يخص〘  '..Controller_Num(7)..' 〙*',"md",true)  
end
Redis:set(Fast.."likweme"..msg_chat_id,"off")
send(msg_chat_id,msg_id,'*\n ↯︙ تم تعطيل امر شبيهي *',"md",true)  
end
if text == "تفعيل مهنه" or text == "تفعيل مهنتي" then
if not msg.Admin then
send(msg_chat_id,msg_id,'*\n ↯︙ هذا الامر يخص〘  '..Controller_Num(7)..' 〙*',"md",true)  
end
Redis:del(Fast.."Mostafa"..msg_chat_id)
send(msg_chat_id,msg_id,'*\n ↯︙ تم تفعيل امر مهنتي *',"md",true)  
end
if text == "تعطيل مهنتي" or text == "تعطيل مهنه" then
if not msg.Admin then
send(msg_chat_id,msg_id,'*\n ↯︙ هذا الامر يخص〘  '..Controller_Num(7)..' 〙*',"md",true)  
end
Redis:set(Fast.."Mostafa"..msg_chat_id,"off")
send(msg_chat_id,msg_id,'*\n ↯︙ تم تعطيل امر مهنتي *',"md",true)  
end
if (text == 'جمالي' or text == 'لينبنان جمالي') and not Redis:get(Fast.."mybuti"..msg_chat_id) then
local Jabwa = bot.getUser(senderr)
local photo = bot.getUserProfilePhotos(senderr)
local nspp = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",}
local rdbhoto = nspp[math.random(#nspp)]
if photo.total_count > 0 then
data = {} 
data.inline_keyboard = {
{
{text = '- نسبه جمالك :'..rdbhoto..' ',url = "https://t.me/"..Jabwa.username..""}, 
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&photo=".. URL.escape(rdbhoto).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(data))
end
end
if (text == 'ابنزملهت' or text == 'حدد وبنانو' or text == 'تنمات شخصيتي') and not Redis:get(Fast.."shakse"..msg_chat_id) then
local texting = {"عنيده", "متردده","خبيثة", "ايجابية ", "غامضة", "ضعيفة ", "كلاسيكية", "مسالمة", "حماسية ", "قيادية", "شكاك", "رومنسية","محفزة","متعاونة","اجتماعية","عصبية ","نرجسية","انطوائية","مظلومة",} 
zezee = texting[math.random(#texting)]
local Jabwa = bot.getUser(senderr)
local photo = bot.getUserProfilePhotos(senderr)
local news = '🥺♥️ شخصيتك ⇿ '..zezee
if photo.total_count > 0 then
Jabwa = {} 
Jabwa.inline_keyboard = {
{
{text =news,url = "https://t.me/"..Jabwa.username..""}, 
},
}
local msgg = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg.chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&photo=".. URL.escape(news).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(Jabwa))
end
end
if text == 'شبيهي' or text =='شبيه' then
local t = '*- اختار اول شخصيتك *'
local photo = bot.getUserProfilePhotos(Fast)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = ' - رجل اعمال ', callback_data=senderr..'/Business'},{text = ' - لاعب ڪره قدم  ', callback_data=senderr..'/Football'},
},
{
{text = '- ممثل ', callback_data=senderr..'/amusement'},{text = ' فنان', callback_data=senderr..'/Singer'},
},
{
{text='- 𝖳𝖾𝖺𝗆 𝖡𝖱𝗈k𝖲.  ',url='t.me/'..chsource..''},
}
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(t).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "انا مين" or text == "أنا مين" then
if not Redis:get(Fast.."SOFI:Channe:Vip"..senderr) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="وضع قناتي",data="/ChangeChanneVip:"..senderr}},
{{text="اخفاء",data="/HideChanneVip:"..senderr}},
}
}
bot.sendText(msg_chat_id,msg_id,Reply_Status(senderr,"* ↯︙ انت لم تقم باضافة قناتك مسبقا\n ↯︙ قم بارسال ضع قناتي + معرف قناتك\n ↯︙ او قم بالضغط علي وضع قناتي\n ↯︙ ثم أرسل الامر + انا منو *").unLock,"md",true, false, false, false, reply_markup)
else
local UserInfo = bot.getUser(senderr)
local bio = getbio(senderr)
local photo = bot.getUserProfilePhotos(senderr)
if photo and photo.total_count and photo.total_count > 0 then
local FiJABWA = (UserInfo.first_name):gsub('#','')
local FixChannel = (Redis:get(Fast.."SOFI:Channe:Vip"..senderr) or "لا يوجد")
local DevSOFI = FixChannel:gsub('@','')
local FixGroupl = (Redis:get(Fast.."SOFI:Group:Vip"..senderr) or "لا يوجد")
local JABWA = FixGroupl:gsub('@','')
local FixBot = (Redis:get(Fast.."SOFI:Bot:Vip"..senderr) or "لا يوجد")
local BOT = FixBot:gsub('@','')
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="- قناتك",url="t.me/"..DevSOFI},{text=" - كروبك",url="t.me/"..JABWA}},
{{text="- بوتك",url="t.me/"..BOT}},
{{text=" "..FiJABWA.." ",url=("t.me/"..UserInfo.username or "t.me/S_a_i_d_i")}},
}}
bot.sendPhoto(msg_chat_id, msg_id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id, bio, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
return false
else
bot.sendText(msg_chat_id,msg_id,'*لا تمتلك صوره في حسابك*',"md",true)  
end
end
end
if text == "اغنية" or text == "اغنيه" then 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n↯︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast..'myniknea'..msg.chat_id) then
Abs = math.random(3,205); 
local Text ='*↯︙ تم اختيار الاغنيه لك*'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '- 𝖳𝖾𝖺𝗆 𝖡𝖱𝗈k𝖲.',url='http://t.me/'..chsource..''}},
}
local MsgId = msg.id/2097152/0.5
local MSGID = 0
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/kk_ko9/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..MSGID.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
end 
if text and text:match("^play (.*)$") then
local q = text:match("^play (.*)$")
if q:match("%a") then
local url = https.request("https://xnxx.Fastbots.ml/apies/playstore.php?q="..URL.escape(q))
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
if text:match("^النلظ (.*)$") or text:match("^توبتل (.*)$") then
if Redis:get(Fast.."intg"..msg.chat_id) then
return false 
end
local inoi = text:match("^تظىمم (.*)$") or text:match("^تلمانظ (.*)$")
local intk = inoi:gsub(" ","-")
if intk:match("%a") then
lan = "en"
else
lan = "ar"
end
local rand = math.random(1,999)
os.execute("gtts-cli "..intk.." -l '"..lan.."' -o 'intk"..rand..".mp3'")
bot.sendAudio(msg_chat_id,msg_id,'./intk'..rand..'.mp3',tostring(inoi),"html",nil,tostring(inoi),"@'..chsource..'")
sleep(1)
os.remove("intk"..rand..".mp3")
end
end
if text == "تقطيع" then
if tonumber(msg.reply_to_message_id) > 0 then
local result = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if result.content.text then 
local line = result.content.text.text
for t in string.gmatch(line, "[^%s]+") do
send(msg_chat_id,msg_id,t,"md",true)  
end 
end
end
end

end
return {Fast = Fast_Fun}