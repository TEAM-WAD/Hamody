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
send(Sudo_Id,0,'*\n↯ ︙ تم تفعيل كروب جديد \n↯ ︙ بواسطه : *['..UserInfo.first_name..'](tg://user?id='..who_promot..')*\n↯ ︙ معلومات الكروب :\n↯ ︙ عدد الاعضاء ← '..Info_Chats.member_count..'\n↯ ︙ عدد الادمنيه ← '..Info_Chats.administrator_count..'\n↯ ︙ عدد المطرودين ← '..Info_Chats.banned_count..'\n↯ ︙ عدد المقيدين ← '..Info_Chats.restricted_count..'\n↯ ︙ الرابط\n : '..Info_Chats.invite_link.invite_link..'*',"md", true, false, false, false, reply_markup)
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
local txt = '↯ ︙ بواسطه 「 ['..UserInfo.first_name..'](tg://user?id='..who_promot..')⁪⁬‌‌‌‌ 」\n↯ ︙  تم تفعيل الكروب ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..') تلقائياً\n '
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


return {Fast = Callback}
