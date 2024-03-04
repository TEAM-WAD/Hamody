function Callback(data)
ChatId = data.chat_id
function requesst(req)
local link = io.popen('curl -s "'..req..'"'):read('*a')
return link
end
if data.Fastbots == "updateChatMember" then
if tonumber(data.new_chat_member.member_id.user_id) == tonumber(Fast) then
if data.new_chat_member.status and data.new_chat_member.status and data.new_chat_member.status.can_delete_messages == true then
local chat_id = data.chat_id
local who_promot = data.actor_user_id

--code start
local Info_Chats = bot.getSupergroupFullInfo(chat_id) ---check if count is true
if not Redis:sismember(Fast.."ChekBotAdd",chat_id) then ---done active
local Get_Chat = bot.getChat(chat_id)
local UserInfo = bot.getUser(who_promot)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
send(Sudo_Id,0,'*\n↯︙ تم تفعيل كروب جديد \n↯︙ بواسطه : *['..UserInfo.first_name..'](tg://user?id='..who_promot..')*\n↯︙ معلومات الكروب :\n↯︙ عدد الاعضاء ← '..Info_Chats.member_count..'\n↯︙ عدد الادمنيه ← '..Info_Chats.administrator_count..'\n↯︙ عدد المطرودين ← '..Info_Chats.banned_count..'\n↯︙ عدد المقيدين ← '..Info_Chats.restricted_count..'\n↯︙ الرابط\n : '..Info_Chats.invite_link.invite_link..'*',"md", true, false, false, false, reply_markup)
local Info_Members = bot.getSupergroupMembers(chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
Redis:sadd(Fast.."ChekBotAdd",chat_id)
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
Redis:sadd(Fast.."Ownerss:Group"..chat_id,v.member_id.user_id) 
else
local lisstt = {
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
for k,v in pairs(lisstt) do
Redis:sadd(Fast.."gamebot:List:Manager",v)
end
Redis:set(Fast..'lock_chengname'..chat_id,true)  
Redis:set(Fast.."Status:Games"..chat_id,true) 
Redis:sadd(Fast.."Admin:Group"..chat_id,v.member_id.user_id) 
Redis:set(Fast.."smsme"..chat_id,true)
Redis:set(Fast.."Status:IdPhoto"..chat_id,true) 
Redis:set(Fast.."Status:Id"..chat_id,true) 
Redis:set(Fast.."Status:ReplySudo"..chat_id,true) 
Redis:set(Fast.."Status:Reply"..chat_id,true) 
Redis:set(Fast.."Status:IdPhoto"..chat_id,true) 
Redis:set(Fast.."Status:Id"..chat_id,true) 
Redis:set(Fast.."Status:Welcome"..chat_id,true) 
Redis:set(Fast.."Status:Link"..chat_id,true) 
Redis:set(Fast.."Status:Games"..chat_id,true) 
Redis:set(Fast..'tagallgroup'..chat_id,'open') 
Redis:set(Fast..'tagall@all'..chat_id,'open') 
Redis:del(Fast.."knele"..chat_id)
Redis:set(Fast.."Status:Link"..chat_id,true) 
Redis:set(Fast.."Status:Welcome"..chat_id,true) 
Redis:set(Fast.."Status:BanId"..chat_id,true) 
Redis:set(Fast.."Status:ReplySudo"..chat_id,true) 
Redis:set(Fast.."Status:Reply"..chat_id,true) 
Redis:set(Fast.."Status:IdPhoto"..chat_id,true) 
Redis:set(Fast.."Status:Id"..chat_id,true) 
Redis:set(Fast.."Status:SetId"..chat_id,true) 
Redis:set(Fast.."Status:KickMe"..chat_id,true) 
Redis:set(Fast.."replayallbot"..chat_id,true)
Redis:del(Fast.."amrthshesh"..chat_id)
Redis:del(Fast.."spammkick"..chat_id)
Redis:del(Fast.."intg"..chat_id)
Redis:del(Fast.."kadmeat"..chat_id)
Redis:del(Fast.."zhrfa"..chat_id)
Redis:del(Fast.."brjj"..chat_id)
Redis:del(Fast.."idnotmembio"..chat_id)
Redis:del(Fast.."idnotmem"..chat_id)
Redis:del(Fast..'lock_geamsAudio1'..chat_id) 
Redis:del(Fast..'lock_geamsAudio'..chat_id) 
Redis:del(Fast.."Lock:tagservrbot"..chat_id)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:del(Fast..''..lock..chat_id)    
end
end
end
end
local txt = '↯︙ بواسطه 「 ['..UserInfo.first_name..'](tg://user?id='..who_promot..')⁪⁬‌‌‌‌ 」\n↯︙  تم تفعيل الكروب ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..') تلقائياً\n '
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- 𝖳𝖾𝖺𝗆 𝖡𝖱𝗈k𝖲.', url = 'http://t.me/IOUTB'}, 
},
}
}
send(chat_id, 0 , txt, 'md', false, false, false, false, reply_markup)
end ---end done active
--code end
end
end
end

if data and data.Fastbots and data.Fastbots == "updateSupergroup" then
local Get_Chat = bot.getChat('-100'..data.supergroup.id)
if data.supergroup.status.Fastbots == "chatMemberStatusBanned" then
Redis:srem(Fast.."ChekBotAdd",'-100'..data.supergroup.id)
for k,v in pairs(Redis:keys("*")) do
if v:match(data.supergroup.id) then
Redis:del(v)
end
end
return send(Sudo_Id,0,'*\n↯︙ تم طرد البوت من كروب جديده \n↯︙ اسم الكروب : '..Get_Chat.title..'\n↯︙ ايدي الكروب :*`-100'..data.supergroup.id..'`\n↯︙ تم مسح جميع البيانات المتعلقه بالكروب',"md")
end
elseif data and data.Fastbots and data.Fastbots == "updateMessageSendSucceeded" then
local msg = data.message
local Chat = msg.chat_id
if msg.content.text then
text = msg.content.text.text
end
if msg.content.video_note then
if msg.content.video_note.video.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
if idPhoto == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.sticker then 
if msg.content.sticker.sticker.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.voice_note then 
if msg.content.voice_note.voice.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.video then 
if msg.content.video.video.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.animation then 
if msg.content.animation.animation.remote.id ==  Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.document then
if msg.content.document.document.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.audio then
if msg.content.audio.audio.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif text then
if text == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
end

elseif data and data.Fastbots and data.Fastbots == "updateNewMessage" then
if data.message.content.Fastbots == "messageChatDeleteMember" or data.message.content.Fastbots == "messageChatAddMembers" or data.message.content.Fastbots == "messagePinMessage" or data.message.content.Fastbots == "messageChatChangeTitle" or data.message.content.Fastbots == "messageChatJoinByLink" then
if Redis:get(Fast.."Lock:tagservr"..data.message.chat_id) then
bot.deleteMessages(data.message.chat_id,{[1]= data.message.id})
end
end 
if tonumber(data.message.sender_user_id) == tonumber(Fast) then
return false
end
File_Bot_Run(data.message,data.message)


elseif data and data.Fastbots and data.Fastbots == "updateMessageEdited" then
-- data.chat_id -- data.message_id
--var(data)
local Message_Edit = bot.getMessage(data.chat_id, data.message_id)
if Message_Edit.sender_id.user_id == Fast then

return false
end
if Message_Edit.sender_id.Fastbots == "messageSenderChat" then

return false
end

File_Bot_Run(Message_Edit,Message_Edit)

if tonumber(Message_Edit.sender_id.user_id) == 6264438859 then
data.The_Controller = 1
elseif tonumber(Message_Edit.sender_id.user_id) == 6264438859 then
data.The_Controller = 1
elseif The_ControllerAll(Message_Edit.sender_id.user_id) == true then  
data.The_Controller = 1
elseif Redis:sismember(Fast.."Devss:Groups",Message_Edit.sender_id.user_id) == true then
data.The_Controller = 2
elseif Redis:sismember(Fast.."Dev:Groups",Message_Edit.sender_id.user_id) == true then
data.The_Controller = 3
elseif Redis:sismember(Fast.."Ownerss:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 44
elseif Redis:sismember(Fast.."SuperCreator:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 4
elseif Redis:sismember(Fast.."Creator:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 5
elseif Redis:sismember(Fast.."Manger:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 6
elseif Redis:sismember(Fast.."Admin:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 7
elseif Redis:sismember(Fast.."Special:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 8
elseif tonumber(Message_Edit.sender_id.user_id) == tonumber(Fast) then
data.The_Controller = 9
else
data.The_Controller = 10
end  
if data.The_Controller == 1 then  
data.ControllerBot = true
end
if data.The_Controller == 1 or data.The_Controller == 2 then
data.Devss = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 then
data.Dev = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 9 then
data.Ownerss = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 9 then
data.SuperCreator = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 9 then
data.Creator = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 9 then
data.Manger = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 7 or data.The_Controller == 9 then
data.Admin = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 7 or data.The_Controller == 8 or data.The_Controller == 9 then
data.Special = true
end
local UserInfo = bot.getUser(Message_Edit.sender_id.user_id)
local names = FlterBio(UserInfo.first_name) 
local monsha = Redis:smembers(Fast.."Ownerss:Group"..data.chat_id) 
Redis:incr(Fast..'Num:Message:Edit'..data.chat_id..Message_Edit.sender_id.user_id)
if not data.Creator then
if Message_Edit.content.Fastbots == "messageContact" or Message_Edit.content.Fastbots == "messageVideoNote" or Message_Edit.content.Fastbots == "messageDocument" or Message_Edit.content.Fastbots == "messageAudio" or Message_Edit.content.Fastbots == "messageVideo" or Message_Edit.content.Fastbots == "messageVoiceNote" or Message_Edit.content.Fastbots == "messageAnimation" or Message_Edit.content.Fastbots == "messagePhoto" then
if tonumber(Message_Edit.sender_id.user_id) == tonumber(Fast) then
return false 
end
if Redis:get(Fast.."Lock:edit"..data.chat_id) then
if #monsha ~= 0 then 
local ListMembers = '\n*↯︙ تاك للمالكين  \n ⎈↯︙━⊶𝐒𝐎𝐔𝐑𝐂𝐄 𝐂𝐀𝐄𝐒𝐀𝐑⊷━↯︙⎈*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
 
local tecxt = ListMembers.."\n\n".."\n↯︙ المستخدم  {["..names.." ](tg://user?id="..Message_Edit.sender_id.user_id..")}"..
"\n↯︙ قام بتعديل الميديا"
send(data.chat_id,0,tecxt,"md")
end
bot.deleteMessages(data.chat_id,{[1]= data.message_id})
end
end
end
elseif data and data.Fastbots and data.Fastbots == "updateNewCallbackQuery" then
-- data.chat_id
-- data.payload.data
-- data.sender_user_id
Text = bot.base64_decode(data.payload.data)
IdUser = data.sender_user_id
ChatId = data.chat_id
Msg_id = data.message_id
user_id = data.sender_user_id
chat_id = data.chat_id
msg_id = data.message_id
--
-- like id 

if Text and Text:match('(%d+)/groupNumseteng//(%d+)') then
local UserId = {Text:match('(%d+)/groupNumseteng//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
return GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id)
end
end
if Text and Text:match('(%d+)/groupNum1//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum1//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).change_info) == 1 then
bot.answerCallbackQuery(data.id, "↯︙ تم تعطيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'⦗ ✗ ⦘',nil,nil,nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,0, 0, 0, 0,0,0,1,0})
else
bot.answerCallbackQuery(data.id, "↯︙ تم تفعيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'⦗ ✓ ⦘',nil,nil,nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,1, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum2//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum2//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).pin_messages) == 1 then
bot.answerCallbackQuery(data.id, "↯︙ تم تعطيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'⦗ ✗ ⦘',nil,nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,0, GetAdminsNum(ChatId,UserId[2]).promote})
else
bot.answerCallbackQuery(data.id, "↯︙ تم تفعيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'⦗ ✓ ⦘',nil,nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,1, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum3//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum3//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).restrict_members) == 1 then
bot.answerCallbackQuery(data.id, "↯︙ تم تعطيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'⦗ ✗ ⦘',nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, 0 ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
bot.answerCallbackQuery(data.id, "↯︙ تم تفعيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'⦗ ✓ ⦘',nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, 1 ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum4//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum4//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).invite_users) == 1 then
bot.answerCallbackQuery(data.id, "↯︙ تم تعطيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'⦗ ✗ ⦘',nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, 0, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
bot.answerCallbackQuery(data.id, "↯︙ تم تفعيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'⦗ ✓ ⦘',nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, 1, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum5//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum5//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).delete_messages) == 1 then
bot.answerCallbackQuery(data.id, "↯︙ تم تعطيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'⦗ ✗ ⦘',nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, 0, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
bot.answerCallbackQuery(data.id, "↯︙ تم تفعيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'⦗ ✓ ⦘',nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, 1, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum6//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum6//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).promote) == 1 then
bot.answerCallbackQuery(data.id, "↯︙ تم تعطيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'⦗ ✗ ⦘')
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, 0})
else
bot.answerCallbackQuery(data.id, "↯︙ تم تفعيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'⦗ ✓ ⦘')
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, 1})
end
end
end

if Text and Text:match('(%d+)/web') then
local UserId = Text:match('(%d+)/web')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).web == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, false, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, true, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/info') then
local UserId = Text:match('(%d+)/info')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).info == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, false, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, true, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/invite') then
local UserId = Text:match('(%d+)/invite')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).invite == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, false, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, true, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/pin') then
local UserId = Text:match('(%d+)/pin')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).pin == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, false)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, true)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/media') then
local UserId = Text:match('(%d+)/media')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).media == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, false, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, true, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/messges') then
local UserId = Text:match('(%d+)/messges')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).messges == true then
bot.setChatPermissions(ChatId, false, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, true, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/other') then
local UserId = Text:match('(%d+)/other')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).other == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, false, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, true, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/polls') then
local UserId = Text:match('(%d+)/polls')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).polls == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, false, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, true, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
end


return {Fast = Callback}
