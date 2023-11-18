enum MentorshipInterest { interested, notInterested, noPreference }

enum CompetitionInterest { interested, notInterested, noPreference }

enum VirtualMoneyFeeling { positive, neutral, negative }

enum PremiumFeatureWillingness { yes, no, maybe }

class FormResponse {
  @override
  String toString() {
    return {
      "email": email,
      "ageGroup": ageGroup,
      "occupation": occupation,
      "country": country,
      "tradingExperience": tradingExperience,
      "weeklyLearningTime": weeklyLearningTime,
      "communityFeatureRelevance": communityFeatureRelevance,
      "anyOtherFeatureMissing": anyOtherFeatureMissing,
      "interestedInMentorship": interestedInMentorship,
      "interestedInCompeting": interestedInCompeting,
      "feelingTowardsVirtualMoney": feelingTowardsVirtualMoney,
      "willingToPayForPremiumFeatures": willingToPayForPremiumFeatures,
      "timeInvestmentPerWeek": timeInvestmentPerWeek,
      "resourcesReferred": resourcesReferred,
      "assetsTraded": assetsTraded,
      "featuresInPlatform": featuresInPlatform,
      "practiceTrading": practiceTrading,
      "engagingFeatures": engagingFeatures,
      "premiumFeatures": premiumFeatures
    }.toString();
  }

  List<String> getAllOccupations() {
    List<String> availableOccupations = [
      'Financial Professional',
      'Tech Industry',
      'Students',
      'Entrepreneur',
      'Healthcare',
      'Legal Profession',
      'Sales and Marketing',
      'Freelancer',
      'Retired'
    ];
    return availableOccupations;
  }

  String email = '';
  String ageGroup = '';
  String occupation = '';
  String country = '';
  String tradingExperience = '';

  double weeklyLearningTime = 0;
  double communityFeatureRelevance = 0;

  String anyOtherFeatureMissing = '';
  String interestedInMentorship = '';
  String interestedInCompeting = '';
  String feelingTowardsVirtualMoney = '';
  String willingToPayForPremiumFeatures = '';
  String timeInvestmentPerWeek = '';

  Map<String, bool> resourcesReferred = {
    'Books': false,
    'Online Courses': false,
    'Youtube': false,
    'Financial News': false,
    'Directly diving into market': false,
    'Others': false
  };
  final Map<String, bool> assetsTraded = {
    'Stocks': false,
    'Forex': false,
    'Cryptocurrency': false,
    'Commodities': false,
    'Options': false
  };
  final Map<String, bool> featuresInPlatform = {
    'Real-world application': false,
    'Interactivity': false,
    'Expert guidance': false,
    'Community support': false,
    'Up-to-date information': false,
    'Customization to my learning pace': false
  };

  final Map<String, bool> practiceTrading = {
    'Real-world trading': false,
    'Paper trading': false,
    'Simulated trading apps': false,
    'I don\'t practice': false
  };

  final Map<String, bool> engagingFeatures = {
    'Gamified challenges': false,
    'Real-world simulations': false,
    'Social competitions': false,
    'Expert-led live sessions': false,
    'Analytics and performance tracking': false
  };

  final Map<String, bool> premiumFeatures = {
    'Advanced analytics': false,
    'Exclusive courses': false,
    'Ad-free experience': false,
    'Not applicable': false
  };
}
