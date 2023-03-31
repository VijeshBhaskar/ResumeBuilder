select * from [RB].[TemplateDetails]

update  [RB].[TemplateDetails]
set [ExperienceHtml]= '<div class="section__list-item" style="margin-bottom: 40px;">
  <div class="left" style=" vertical-align: top;      display: inline-block;width: 60%;">
    <div class="name" style="font-weight: bold;"><$ExpEmployer$></div>
    <div class="addr"><$ExpCity$></div>
    <div class="duration"><$ExpStartDate$> - <$ExpEndDate$></div>
  </div>
  <div class="right" style="vertical-align: top;      display: inline-block;tex-align: right;      width: 39%;">
    <div class="name" style="font-weight: bold;"><$ExpJobTitle$></div>
    <div class="desc"><$ExpJobDesc$></div>
  </div>
</div>'

update  [RB].[TemplateDetails]
set [EducationHtml]=
'<div class="section__list-item" style="margin-bottom: 40px;">
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
</div>'
where templateid=1
exec [RB].[SelectTemplateDetailByID]
@TemplateId=1,
@UserID =1
