update  [RB].[TemplateDetails]
set [TemplateHtml]='<div id="printArea"><link href=''https://fonts.googleapis.com/css?family=Lato:400,300,700'' rel=''stylesheet''
type=''text/css''>
<div class="container" style="max-width: 700px;       background: #fff;    margin: 0px auto 0px;     box-shadow: 1px 1px 2px #DAD7D7;    border-radius: 3px;      padding: 40px;    margin-top: 50px;">
  <div class="header" style="margin-bottom: 30px;">
    <div class="full-name" style="font-size: 40px;      text-transform: uppercase;      margin-bottom: 5px;">
      <span class="first-name" style="font-weight: 700;">
        <$FIRSTNAME$>
      </span>
      <span class="last-name" style="font-weight: 300;">
        <$LASTNAME$>
      </span>
    </div>
    <div class="contact-info" style="margin-bottom: 20px;">
      <span class="email" style="color: #999;      font-weight: 300;">Email: </span>
      <span class="email-val"><$EMAIL$></span>
      <span class="separator" style="height: 10px;      display: inline-block;      border-left: 2px solid #999;      margin: 0px 10px;"></span>
      <span class="phone" style="color: #999;      font-weight: 300;">Phone: </span>
      <span class="phone-val"><$PHONENUMBER$></span>
    </div>
    <div class="about">
      <span class="position" style="font-weight: bold;      display: inline-block;      margin-right: 10px;      text-decoration: underline;"><$JOBTITLE$></span>
      <span class="desc"><$SUMMARY$></span>
    </div>
  </div>
  <div class="details" style="line-height: 20px;">
     <div class="section" style="margin-bottom: 40px;">
      <div class="section__title" style="letter-spacing: 2px;      color: #54AFE4;      font-weight: bold;      margin-bottom: 10px;      text-transform: uppercase; <$ISDISPLAYEXP$>">Experience</div>
      <$ExperienceHtml$>
    </div>
   <div class="section">
      <div class="section__title" style="letter-spacing: 2px;      color: #54AFE4;      font-weight: bold;      margin-bottom: 10px;      text-transform: uppercase; <$ISDISPLAYEDU$>">Education</div>
      <$EducationHtml$>
      
    </div>
    <div class="section">
      <div class="section__title" style="letter-spacing: 2px;      color: #54AFE4;      font-weight: bold;      margin-bottom: 10px;      text-transform: uppercase; <$ISDISPLAYSKILLS$>">Skills</div>
      <$SkillsHtml$>
    </div>
   <div class="section" style=" margin-bottom: 0px;">
      <div class="section__title" style="letter-spacing: 2px;margin-bottom: 0;      color: #54AFE4;      font-weight: bold;      margin-bottom: 10px;      text-transform: uppercase; <$ISDISPLAYHOBBY$>"> 
      INTERESTS</div>
      <$HobbyHtml$>
      </div>
    </div>
    
  </div>
</div>
</div></div>'
where templateid=1



update  [RB].[TemplateDetails]
set [ExperienceHtml]='<div class="section__list">
        <div class="section__list-item" style="margin-bottom: 40px;">
  <div class="left" style=" vertical-align: top;      display: inline-block;width: 60%;">
    <div class="name" style="font-weight: bold;"><$ExpEmployer$></div>
    <div class="addr"><$ExpCity$></div>
    <div class="duration"><$ExpStartDate$> - <$ExpEndDate$></div>
  </div>
  <div class="right" style="vertical-align: top;      display: inline-block;tex-align: right;      width: 39%;">
    <div class="name" style="font-weight: bold;"><$ExpJobTitle$></div>
    <div class="desc"><$ExpJobDesc$></div>
  </div>
</div>
      </div>'
	where templateid=1


update  [RB].[TemplateDetails]
set [EducationHtml]='<div class="section__list">
       <div class="section__list-item" style="margin-bottom: 40px;">
  <div class="left" style=" vertical-align: top;      display: inline-block;width: 60%;">
    <div class="name" style="font-weight: bold;">
      <$EduSchool$>
    </div>
    <div class="addr">
      <$EduCity$>
    </div>
    <div class="duration">
      <$EduStartDate$> - <$EduEndDate$>
    </div>
  </div>
  <div class="right" style="vertical-align: top;      display: inline-block;tex-align: right;      width: 39%;">
    <div class="name" style="font-weight: bold;">
      <$Education$>
    </div>
  </div>
</div>
      </div>'
where templateid=1


update  [RB].[TemplateDetails]
set [SkillsHtml]=' <div class="skills">
        <div class="skills__item" style="margin-bottom: 10px;">
          <div class="left" style=" vertical-align: top;      display: inline-block;width: 60%;">
            <div class="name" style="font-weight: bold;"><$SkillName$></div>
          </div>
        </div>
      </div>'
where templateid=1



update  [RB].[TemplateDetails]
set [HobbyHtml]=' <div class="section__list">
        <div class="section__list-item" style="margin-bottom: 40px;"> <$HobbyName$></div>'
where templateid=1
