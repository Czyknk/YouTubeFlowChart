
;;;======================================================
;;;   Automotive Expert System
;;;
;;;     This expert system diagnoses some simple
;;;     problems with a car.
;;;
;;;     CLIPS Version 6.3 Example
;;;
;;;     For use with the Auto Demo Example
;;;======================================================

;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list))
   
;;;****************
;;;* STARTUP RULE *
;;;****************



(defrule system-banner ""

  =>
  
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule determine-chanel-type ""

   (logical (start))

   =>

   (assert (UI-state (display StartQuestion)
                     (relation-asserted chanel-type)
                     (response Musician)
                     (valid-answers Musician Vlogger))))

;;;MUSICIAN
(defrule determine-wizard-or-muggle ""

   (logical (chanel-type Musician))

   =>

   (assert (UI-state (display WizardOrMuggleQuestion)
                     (relation-asserted wizard-or-muggle)
                     (response Wizard)
                     (valid-answers Wizard Muggle))))
                     
(defrule determine-wizard-rock ""

   (logical (wizard-or-muggle Wizard))

   =>

   (assert (UI-state (display WizardRockQuestion)
                     (relation-asserted wizard-rock)
                     (response kindofweirdAnswear)
                     (valid-answers kindofweirdAnswear Awesome))))

(defrule determine-live-performances ""

   (logical (wizard-rock Awesome))

   =>

   (assert (UI-state (display LivePerformancesQuestion)
                     (relation-asserted live-performances)
                     (response Yes)
                     (valid-answers No Yes))))

(defrule determine-ministory-of-magic-cds ""

   (logical (live-performances No))

   =>

   (assert (UI-state (display MinistryOfMagicQuestion)
                     (relation-asserted ministory-of-magic-cds)
                     (response WeasleyAnswear)
                     (valid-answers WeasleyAnswear AsmalfoyAnswear))))

(defrule determine-whomping-willow ""

   (logical (ministory-of-magic-cds AsmalfoyAnswear))

   =>

   (assert (UI-state (display WhompingWillowQuestion)
                     (relation-asserted whomping-willow)
                     (response False)
                     (valid-answers False True))))

(defrule determine-muggle-exist ""

   (logical (wizard-or-muggle Muggle))

   =>

   (assert (UI-state (display MuggleExistQuestion)
                     (relation-asserted muggle-exist)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-lost-show ""

   (logical (muggle-exist Yes))

   =>

   (assert (UI-state (display LostShowQuestion)
                     (relation-asserted lost-show)
                     (response NAA)
                     (valid-answers NAA Absolutely))))

(defrule determine-couples-music ""

   (logical (lost-show NAA))

   =>

   (assert (UI-state (display CoupleMusicQuestion)
                     (relation-asserted couples-music)
                     (response Blech)
                     (valid-answers Blech YES))))
                     
(defrule determine-electronica ""

   (logical (couples-music YES))

   =>

   (assert (UI-state (display ElectronicaQuestion)
                     (relation-asserted electronica)
                     (response No)
                     (valid-answers No YES))))                     

(defrule determine-easily-offended ""

   (logical (couples-music Blech))

   =>

   (assert (UI-state (display OffendedQuestion)
                     (relation-asserted easily-offended)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-like-ukuleles ""

   (logical (easily-offended Yes))

   =>

   (assert (UI-state (display UkuleleQuestion)
                     (relation-asserted like-ukuleles)
                     (response NR)
                     (valid-answers NR HECKYES))))
                     
(defrule determine-nerdy-or-normal ""

   (logical (like-ukuleles HECKYES))

   =>

   (assert (UI-state (display NerdyOrNormalQuestion)
                     (relation-asserted nerdy-or-normal)
                     (response Nerdy)
                     (valid-answers Nerdy Normal))))

(defrule determine-mellow-or-rock ""

   (logical (like-ukuleles NR))

   =>

   (assert (UI-state (display MellowOrRockQuestion)
                     (relation-asserted mellow-or-rock)
                     (response Rock)
                     (valid-answers Rock Mellow))))
                     
(defrule determine-normal-or-strange ""

   (logical (mellow-or-rock Rock))

   =>

   (assert (UI-state (display StrangeLyricsQuestion)
                     (relation-asserted normal-or-strange)
                     (response Strange)
                     (valid-answers Strange Normal))))

(defrule determine-miley-or-randomness ""

   (logical (mellow-or-rock Rock))

   =>

   (assert (UI-state (display MileyOrRandomnessQuestion)
                     (relation-asserted miley-or-randomness)
                     (response Miley)
                     (valid-answers Miley Random))))

(defrule determine-piano-or-guitar ""

   (logical (normal-or-strange Normal))

   =>

   (assert (UI-state (display PianoOrGuitarQuestion)
                     (relation-asserted piano-or-guitar)
                     (response Piano)
                     (valid-answers Piano Guitar))))


;;;VLOGGER
(defrule determine-collab-or-single ""

   (logical (chanel-type Vlogger))

   =>

   (assert (UI-state (display CollabOrSingleQuestion)
                     (relation-asserted collab-or-single)
                     (response Collab)
                     (valid-answers Collab Single))))

(defrule determine-new-or-two ""

   (logical (collab-or-single Collab))

   =>

   (assert (UI-state (display NewOrTwoQuestion)
                     (relation-asserted new-or-two)
                     (response Old)
                     (valid-answers Old New))))

(defrule determine-make-out ""

   (logical (new-or-two New))

   =>

   (assert (UI-state (display MakeoutQuestion)
                     (relation-asserted make-out)
                     (response Happy)
                     (valid-answers Happy Sick))))

(defrule determine-doctor-who ""

   (logical (make-out Sick))

   =>

   (assert (UI-state (display DoctorWhoQuestion)
                     (relation-asserted doctor-who)
                     (response Absolutely)
                     (valid-answers Absolutely WT))))

(defrule determine-number-of-people ""

   (logical (doctor-who WT))

   =>

   (assert (UI-state (display NumberOfPeopleQuestion)
                     (relation-asserted number-of-people)
                     (response Five)
                     (valid-answers Five Two))))

(defrule determine-short-or-tall ""

   (logical (number-of-people Two))

   =>

   (assert (UI-state (display ShortOrTallPeopleQuestion)
                     (relation-asserted short-or-tall)
                     (response Tall)
                     (valid-answers Tall Short))))

(defrule determine-girls-or-boys ""

   (logical (short-or-tall Tall))

   =>

   (assert (UI-state (display GirlsOrBoysQuestion)
                     (relation-asserted girls-or-boys)
                     (response Girls)
                     (valid-answers Girls Boys))))

(defrule determine-kind-of-accent ""

   (logical (collab-or-single Single))

   =>

   (assert (UI-state (display KindOfAccentQuestion)
                     (relation-asserted kind-of-accent)
                     (response SthElse)
                     (valid-answers SthElse British American))))

(defrule determine-canada ""

   (logical (kind-of-accent SthElse))

   =>

   (assert (UI-state (display CanadaQuestion)
                     (relation-asserted canada)
                     (response YEAH)
                     (valid-answers YEAH CanadaSucks))))

(defrule determine-funnier ""

   (logical (canada CanadaSucks))

   =>

   (assert (UI-state (display FunnierQuestion)
                     (relation-asserted funnier)
                     (response Humor)
                     (valid-answers Humor Chickens))))

(defrule determine-david-tennant ""

   (logical (kind-of-accent British))

   =>

   (assert (UI-state (display DavidTennantQuestion)
                     (relation-asserted david-tennant)
                     (response Duh)
                     (valid-answers Duh No))))
;;;____________________________________________________________________________________
(defrule determine-boys-who-play ""

   (logical (david-tennant No))

   =>

   (assert (UI-state (display BoysWhoPlayQuestion)
                     (relation-asserted boys-who-play)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-twilight ""

   (logical (boys-who-play Yes))

   =>

   (assert (UI-state (display TwilightQuestion)
                     (relation-asserted twilight)
                     (response No)
                     (valid-answers No DC Yes))))

(defrule determine-scripted-or-spontaneous ""

   (logical (boys-who-play No))

   =>

   (assert (UI-state (display ScriptedOrSpontaneousQuestion)
                     (relation-asserted scripted-or-spontaneous)
                     (response Spontaneous)
                     (valid-answers Spontaneous Scripted))))


(defrule determine-sing-or-never ""

   (logical (kind-of-accent American))

   =>

   (assert (UI-state (display SingsOrNotQuestion)
                     (relation-asserted sing-or-never)
                     (response SometimesSings)
                     (valid-answers SometimesSings NeverSings))))

(defrule determine-daily-videos ""

   (logical (sing-or-never NeverSings))

   =>

   (assert (UI-state (display DailyVideosQuestion)
                     (relation-asserted daily-videos)
                     (response Yes)
                     (valid-answers Yes No))))

(defrule Breakingnyc ""
	(logical (daily-videos Yes))
	
	=>
	
	(assert (UI-state (display BreakingnycResult)
						(state final))))

(defrule determine-need-avice ""

   (logical (daily-videos No))

   =>

   (assert (UI-state (display AviceQuestion)
                     (relation-asserted need-avice)
                     (response YP)
                     (valid-answers YP No))))

(defrule Peron75 ""
	(logical (need-avice YP))
	
	=>
	
	(assert (UI-state (display Peron75Result)
						(state final))))

(defrule determine-different-versions ""

   (logical (need-avice No))

   =>

   (assert (UI-state (display DifferentVersionsQuestion)
                     (relation-asserted different-versions)
                     (response Yes)
                     (valid-answers Yes NoThatsWeird))))

(defrule Elmify ""
	(logical (different-versions Yes))
	
	=>
	
	(assert (UI-state (display ElmifyResult)
						(state final))))

(defrule determine-subscribers ""

   (logical (different-versions NoThatsWeird))

   =>

   (assert (UI-state (display SubscribersQuestion)
                     (relation-asserted subscribers)
                     (response More)
                     (valid-answers More Less))))

(defrule determine-watch-someone ""

   (logical (subscribers More))

   =>

   (assert (UI-state (display WatchSomeoneQuestion)
                     (relation-asserted watch-someone)
                     (response TalkWorldIssues)
                     (valid-answers TalkWorldIssues MakeUp Rant))))

(defrule Pogobat ""
	(logical (watch-someone TalkWorldIssues))
	
	=>
	
	(assert (UI-state (display PogobatResult)
						(state final))))

(defrule Meekakitty ""
	(logical (watch-someone Rant))
	
	=>
	
	(assert (UI-state (display MeekakittyResult)
						(state final))))

(defrule Michellephan ""
	(logical (watch-someone MakeUp))
	
	=>
	
	(assert (UI-state (display MichellephanResult)
						(state final))))

(defrule determine-typography ""

   (logical (subscribers Less))

   =>

   (assert (UI-state (display TypographyQuestion)
                     (relation-asserted typography)
                     (response Agreed)
                     (valid-answers Agreed Typography))))

(defrule Xperpetualmotion ""
	(logical (typography Agreed))
	
	=>
	
	(assert (UI-state (display XperpetualmotionResult)
						(state final))))

(defrule determine-only-fiveawesomes ""

   (logical (typography Typography))

   =>

   (assert (UI-state (display OnlyFiveawesomes)
                     (relation-asserted only-fiveawesomes)
                     (response Yes)
                     (valid-answers Yes WhoAreThey))))

(defrule Thatzak ""
	(logical (only-fiveawesomes WhoAreThey))
	
	=>
	
	(assert (UI-state (display ThatzakResult)
						(state final))))

(defrule determine-girls-or-boys-only-fiveawesomes ""

   (logical (only-fiveawesomes Yes))

   =>

   (assert (UI-state (display GirlsOrBoysQuestion)
                     (relation-asserted girls-or-boys-only-fiveawesomes)
                     (response Girls)
                     (valid-answers Girls Boys))))

(defrule Alanvlogs ""
	(logical (determine-girls-or-boys-only-fiveawesomes Boys))
	
	=>
	
	(assert (UI-state (display AlanvlogsResult)
						(state final))))

(defrule Owlssayhoot ""
	(logical (determine-girls-or-boys-only-fiveawesomes Girls))
	
	=>
	
	(assert (UI-state (display OwlssayhootResult)
						(state final))))




(defrule determine-rapping ""

   (logical (sing-or-never SometimesSings))

   =>

   (assert (UI-state (display RappingQuestion)
                     (relation-asserted rapping)
                     (response Yes)
                     (valid-answers Yes No))))

(defrule Hayleyghoover ""
	(logical (rapping Yes))
	
	=>
	
	(assert (UI-state (display HayleyghooverResult)
						(state final))))

(defrule determine-breakfast ""

   (logical (rapping No))

   =>

   (assert (UI-state (display BreakfastQuestion)
                     (relation-asserted breakfast)
                     (response OC)
                     (valid-answers OC UmN))))

(defrule Wheezywaiter ""
	(logical (breakfast OC))
	
	=>
	
	(assert (UI-state (display WheezywaiterResult)
						(state final))))

(defrule determine-charts-and-graphs ""

   (logical (breakfast UmN))

   =>

   (assert (UI-state (display ChartsAndGraphsQuestion)
                     (relation-asserted charts-and-graphs)
                     (response YES)
                     (valid-answers YES NR))))

(defrule Mickeleh ""
	(logical (charts-and-graphs Yes))
	
	=>
	
	(assert (UI-state (display MickelehResult)
						(state final))))

(defrule determine-caps ""

   (logical (charts-and-graphs NR))

   =>

   (assert (UI-state (display CapsQuestion)
                     (relation-asserted caps)
                     (response Yes)
                     (valid-answers Yes NotMyStyle))))

(defrule determine-girls-or-boys-rule ""

   (logical (caps Yes))

   =>

   (assert (UI-state (display GirlsOrBoysRuleQuestion)
                     (relation-asserted girls-or-boys-rule)
                     (response GIRLS)
                     (valid-answers GIRLS BOYS))))

(defrule Italktosnakes ""
	(logical (girls-or-boys-rule GIRLS))
	
	=>
	
	(assert (UI-state (display ItalktosnakesResult)
						(state final))))

(defrule Lukeconard ""
	(logical (girls-or-boys-rule BOYS))
	
	=>
	
	(assert (UI-state (display LukeconardResult)
						(state final))))

(defrule determine-fiveawesomegirl ""

   (logical (caps NotMyStyle))

   =>

   (assert (UI-state (display FiveawesomegirlQuestion)
                     (relation-asserted fiveawesomegirl)
                     (response Yes)
                     (valid-answers Yes No))))

(defrule Devilishlypure ""
	(logical (fiveawesomegirl Yes))
	
	=>
	
	(assert (UI-state (display DevilishlypureResult)
						(state final))))

(defrule determine-happy-people ""

   (logical (fiveawesomegirl No))

   =>

   (assert (UI-state (display HappyPeopleQuestion)
                     (relation-asserted happy-people)
                     (response Angry)
                     (valid-answers Angry HappyD))))

(defrule Hopeonatenspeed ""
	(logical (happy-people HappyD))
	
	=>
	
	(assert (UI-state (display HopeonatenspeedResult)
						(state final))))

(defrule determine-vlogger ""

   (logical (happy-people Angry))

   =>

   (assert (UI-state (display VloggerQuestion)
                     (relation-asserted vlogger)
                     (response TalkFast)
                     (valid-answers TalkFast TalkSlow))))

(defrule Fizzylimon ""
	(logical (vlogger TalkFast))
	
	=>
	
	(assert (UI-state (display FizzylimonResult)
						(state final))))

(defrule determine-vlogger-review ""

   (logical (vlogger TalkSlow))

   =>

   (assert (UI-state (display VloggerReviewQuestion)
                     (relation-asserted vlogger-review)
                     (response Technology)
                     (valid-answers Technology Books))))

(defrule Ijustine ""
	(logical (vlogger-review Technology))
	
	=>
	
	(assert (UI-state (display IjustineResult)
						(state final))))

(defrule Bandgeek8408 ""
	(logical (vlogger-review Books))
	
	=>
	
	(assert (UI-state (display Bandgeek8408Result)
						(state final))))


;;;****************
;;;* YT CHANNEL RULES *
;;;****************

;;;MUSICIAN

(defrule feltbeats ""
	(logical (wizard-rock kindofweirdAnswear))
	
	=>
	
	(assert (UI-state (display FeltbeatsResult)
						(state final))))

(defrule karenswrockvideos ""
	(logical (live-performances Yes))
	
	=>
	
	(assert (UI-state (display KrenswrockvideosResult)
						(state final))))
						
(defrule ministoryofmagicmusic ""
	(logical (ministory-of-magic-cds WeasleyAnswear))
	
	=>
	
	(assert (UI-state (display MinistoryofmagicResult)
						(state final))))

(defrule thewhompingwillows ""
	(logical (whomping-willow True))
	
	=>
	
	(assert (UI-state (display ThewhompingwillowsResult)
						(state final))))

(defrule butterbeerwrocks ""
	(logical (whomping-willow False))
	
	=>
	
	(assert (UI-state (display ButterbeerwrocksResult)
						(state final))))
						
(defrule paigerailstone ""
	(logical (muggle-exist No))
	
	=>
	
	(assert (UI-state (display PaigerailstoneResult)
						(state final))))

(defrule theoceanicsixmusic ""
	(logical (lost-show Absolutely))
	
	=>
	
	(assert (UI-state (display TheoceanicsixmusicResult)
						(state final))))

(defrule allcapsmusic ""
	(logical (electronica YES))
	
	=>
	
	(assert (UI-state (display AllcapsmusicResult)
						(state final))))

(defrule pomplamoosemusic ""
	(logical (electronica No))
	
	=>
	
	(assert (UI-state (display PomplamoosemusicResult)
						(state final))))

(defrule boburnham ""
	(logical (easily-offended No))
	
	=>
	
	(assert (UI-state (display BoburnhamResult)
						(state final))))

(defrule sweetafton23 ""
	(logical (nerdy-or-normal Nerdy))
	
	=>
	
	(assert (UI-state (display Sweetafton23Result)
						(state final))))

(defrule jaaaaaaa ""
	(logical (nerdy-or-normal Normal))
	
	=>
	
	(assert (UI-state (display JaaaaaaaResult)
						(state final))))

(defrule songsfrompaul ""
	(logical (mellow-or-rock Mellow))
	
	=>
	
	(assert (UI-state (display SongsfrompaulResult)
						(state final))))

(defrule davedays ""
	(logical (miley-or-randomness Miley))
	
	=>
	
	(assert (UI-state (display DavedaysResult)
						(state final))))

(defrule rhettandlink ""
	(logical (miley-or-randomness Random))
	
	=>
	
	(assert (UI-state (display RhettandlinkResult)
						(state final))))

(defrule mikelombardomusic ""
	(logical (piano-or-guitar Piano))
	
	=>
	
	(assert (UI-state (display MikelombardomusicResult)
						(state final))))

(defrule doctornoise ""
	(logical (piano-or-guitar Guitar))
	
	=>
	
	(assert (UI-state (display DoctornoiseResult)
						(state final))))
;;;VLOGGER
(defrule Fiveawesomeguys ""
	(logical (new-or-two Old))
	
	=>
	
	(assert (UI-state (display FiveawesomeguysResult)
						(state final))))

(defrule Vloglovers ""
	(logical (make-out Happy))
	
	=>
	
	(assert (UI-state (display VlogloversResult)
						(state final))))

(defrule Tardistacular ""
	(logical (doctor-who Absolutely))
	
	=>
	
	(assert (UI-state (display TardistacularResult)
						(state final))))

(defrule Fiveawesomegirls ""
	(logical (number-of-people Five))
	
	=>
	
	(assert (UI-state (display FiveawesomegirlsResult)
						(state final))))


(defrule Sistersalad ""
	(logical (girls-or-boys Girls))
	
	=>
	
	(assert (UI-state (display SistersaladResult)
						(state final))))

(defrule Vlogbrothers ""
	(logical (girls-or-boys Boys))
	
	=>
	
	(assert (UI-state (display VlogbrothersResult)
						(state final))))

(defrule Shortsisters765 ""
	(logical (short-or-tall Short))
	
	=>
	
	(assert (UI-state (display Shortsisters765Result)
						(state final))))

(defrule Gunarolla ""
	(logical (canada YEAH))
	
	=>
	
	(assert (UI-state (display GunarollaResult)
						(state final))))

(defrule Robofillet ""
	(logical (funnier Chickens))
	
	=>
	
	(assert (UI-state (display RobofilletResult)
						(state final))))

(defrule Communitychannel ""
	(logical (funnier Humor))
	
	=>
	
	(assert (UI-state (display CommunitychannelResult)
						(state final))))


(defrule Littleradge ""
	(logical (david-tennant Duh))
	
	=>
	
	(assert (UI-state (display LittleradgeResult)
						(state final))))

;;;____________________________________________________________________________________
(defrule Getoutofmyflowchart ""
	(logical (twilight No))
	
	=>
	
	(assert (UI-state (display GetoutofmyflowchartResult)
						(state final))))

(defrule Charlieissocoollike ""
	(logical (twilight DC))
	
	=>
	
	(assert (UI-state (display CharlieissocoollikeResult)
						(state final))))

(defrule Neverimon ""
	(logical (twilight Yes))
	
	=>
	
	(assert (UI-state (display NeverimonResult)
						(state final))))

(defrule Missxrojas ""
	(logical (scripted-or-spontaneous Spontaneous))
	
	=>
	
	(assert (UI-state (display MissxrojasResult)
						(state final))))

(defrule Electricfaeriedust ""
	(logical (scripted-or-spontaneous Scripted))
	
	=>
	
	(assert (UI-state (display ElectricfaeriedustResult)
						(state final))))



;;;NO RESPONCES
(defrule no-repairs ""

   (declare (salience -10))
  
   (logical (UI-state (id ?id)))
   
   (state-list (current ?id))
     
   =>
  
   (assert (UI-state (display InProgress)
                     (state final))))
;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))
   
