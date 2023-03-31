update  [RB].[TemplateDetails]
set [TemplateHtml]='<div id="printArea"><link href=''https://fonts.googleapis.com/css?family=Lato:400,300,700'' rel=''stylesheet'' type=''text/css''>
<div class="container" style="max-width: 700px;       background: #fff;    margin: 0px auto 0px;     box-shadow: 1px 1px 2px #DAD7D7;    border-radius: 3px;      padding: 40px;    margin-top: 50px;">
  <div class="header" style="margin-bottom: 30px;">
    <div class="full-name" style="font-size: 40px;      text-transform: uppercase;      margin-bottom: 5px;">
      <span class="first-name" style="font-weight: 700;">
        <$FirstName$>
      </span>
      <span class="last-name" style="font-weight: 300;">
        <$LastName$>
      </span>
    </div>
    <div class="contact-info" style="margin-bottom: 20px;">
      <span class="email" style="color: #999;      font-weight: 300;">Email: </span>
      <span class="email-val"><$Email$></span>
      <span class="separator" style="height: 10px;      display: inline-block;      border-left: 2px solid #999;      margin: 0px 10px;"></span>
      <span class="phone" style="color: #999;      font-weight: 300;">Phone: </span>
      <span class="phone-val"><$PhoneNumber$></span>
    </div>
    <div class="about">
      <span class="position" style="font-weight: bold;      display: inline-block;      margin-right: 10px;      text-decoration: underline;">Front-End Developer </span>
      <span class="desc"> I am a front-end developer with more than 3 years of experience writing html, css, and js. I''m motivated, result-focused and seeking a successful team-oriented company with opportunity to grow. </span>
    </div>
  </div>
  <div class="details" style="line-height: 20px;">
    <div class="section" style="margin-bottom: 40px;">
      <div class="section__title" style="letter-spacing: 2px;      color: #54AFE4;      font-weight: bold;      margin-bottom: 10px;      text-transform: uppercase;">Experience</div>
      <div class="section__list">
        <$ExperienceHtml$>
      </div>
    </div>
    <div class="section">
      <div class="section__title" style="letter-spacing: 2px;      color: #54AFE4;      font-weight: bold;      margin-bottom: 10px;      text-transform: uppercase;">Education</div>
      <div class="section__list">
       <$EducationHtml$>
      </div>
    </div>
   
    <div class="section">
      <div class="section__title" style="letter-spacing: 2px;      color: #54AFE4;      font-weight: bold;      margin-bottom: 10px;      text-transform: uppercase;">Skills</div>
      <div class="skills">
        <div class="skills__item" style="margin-bottom: 10px;">
          <div class="left" style=" vertical-align: top;      display: inline-block;width: 60%;">
            <div class="name" style="font-weight: bold;"> Javascript </div>
          </div>
        </div>
      </div>
      <div class="skills__item" style="margin-bottom: 10px;">
        <div class="left" style=" vertical-align: top;      display: inline-block;width: 60%;">
          <div class="name" style="font-weight: bold;"> CSS</div>
        </div>
      </div>
    </div>
    <div class="section" style=" margin-bottom: 0px;">
      <div class="section__title" style="letter-spacing: 2px;margin-bottom: 0;      color: #54AFE4;      font-weight: bold;      margin-bottom: 10px;      text-transform: uppercase;"> Interests </div>
      <div class="section__list">
        <div class="section__list-item" style="margin-bottom: 40px;"> Football, programming. </div>
      </div>
    </div>
  </div>
</div>
</div></div>'
