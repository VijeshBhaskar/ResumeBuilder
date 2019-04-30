using System;
using System.Collections.Generic;

namespace ResumeBuilder.Models
{
  public class Resume
  {
    private string _name;
    private int _birthYear;
    private string _email;
    private string _phone;
    private string _city;
    private string _state;
    private string _career;

    private Dictionary<string, Dictionary<string, string>> _education;

    private Dictionary<string, Dictionary<string, string>> _experience;

    private Dictionary<string, List<string>> _skills = new Dictionary<string, List<string>>()
    {
      {"athlete", new List<string>(){"Team Player", "Strong", "Fast", "Flexible"}},
      {"doctor", new List<string>(){"6+ years of medical practice", "Caring", "Intelligent", "Discreet"}},
      {"chef", new List<string>(){"Not easily stressed", "Knife Skills", "Great Multi-Tasker", "Refined Palette"}},
      {"developer", new List<string>(){"10+ years of experience", "Not easily stressed", "Familiar with all languages", "Less nerdy than most"}}
    };

    private Dictionary<string, string> _industry = new Dictionary<string, string>()
    {
      {"athlete", "sports"},
      {"doctor", "medical"},
      {"chef", "culinary"},
      {"developer", "technology"}
    };


    public Resume(string Name, int BirthYear, string Email, string Phone, string City, string Career, string State)
    {
      _name = Name;
      _birthYear = BirthYear;
      _email = Email;
      _phone = Phone;
      _city = City;
      _career = Career;
      _state = State;

      _education = new Dictionary<string, Dictionary<string, string>>()
      {
        {"athlete", new Dictionary<string, string>(){{"institution", "University of " + _state}, {"years", (_birthYear + 18).ToString() + " - " + (_birthYear + 22).ToString()}, {"degree", "BA in Communications"}}},
        {"doctor", new Dictionary<string, string>(){{"institution", "Weill Cornell Medical College"}, {"years", (_birthYear + 18).ToString() + " - " + (_birthYear + 26).ToString()}, {"degree", "Doctor of Medicine"}}},
        {"chef", new Dictionary<string, string>(){{"institution", "Le Cordon Bleu"}, {"years", (_birthYear + 18).ToString() + " - " + (_birthYear + 22).ToString()}, {"degree", "BA in Culinary Arts"}}},
        {"developer", new Dictionary<string, string>(){{"institution", "Epicodus"}, {"years", (_birthYear + 30).ToString() + " - " + (_birthYear + 31).ToString()}, {"degree", "Pat on the Back"}}}
      };

      //HACK Using comma separated values in a string in place of a List for _experience["duties"].
      _experience = new Dictionary<string, Dictionary<string, string>>()
      {
        {"athlete", new Dictionary<string, string>(){{"employer", "Major League Rugby"}, {"years", (DateTime.Now.Year - 5).ToString() + " - Present"}, {"position", "Player, Seattle Seawolves"}, {"duties", "Work as part of a team,Catch balls,Throw balls,Run"}}},
        {"doctor", new Dictionary<string, string>(){{"employer", "Swedish Medical Center"}, {"years", (DateTime.Now.Year - 5).ToString() + " - Present"}, {"position", "Physician"}, {"duties", "Diagnoses,Prognoses,Life-saving"}}},
        {"chef", new Dictionary<string, string>(){{"employer", "The Cheesecake Factory"}, {"years", (DateTime.Now.Year - 5).ToString() + " - Present"}, {"position", "Head Chef"}, {"duties", "Create new menu items,Train incoming staff,Dazzle your tastebuds"}}},
        {"developer", new Dictionary<string, string>(){{"employer", "Floogle"}, {"years", (DateTime.Now.Year - 5).ToString() + " - Present"}, {"position", "Senior Developer"}, {"duties", "Hack,Code,Develop"}}}
      };
    }

    public string GetName()
    {
      return _name;
    }

    public string GetCareer()
    {
      return _career;
    }

    public string GetPhone()
    {
      return _phone;
    }

    public string GetEmail()
    {
      return _email;
    }

    public string GetCity()
    {
      return _city;
    }

    public string GetState()
    {
      return _state;
    }

    public string GetIndustry()
    {
      return _industry[_career];
    }

    public Dictionary<string, List<string>> GetSkills()
    {
      return _skills;
    }

    public Dictionary<string, Dictionary<string, string>> GetEducation()
    {
      return _education;
    }

    public Dictionary<string, Dictionary<string, string>> GetExperience()
    {
      return _experience;
    }
  }
}
