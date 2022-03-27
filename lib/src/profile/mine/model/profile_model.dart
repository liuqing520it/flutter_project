
enum RowType {
  feedback,
  aboutUs,
  contactUs,
  systemSetting,
}
class ProfileModel {
  final String imageName;
  final String title;
  final RowType rowType;
  ProfileModel(this.imageName, this.title, this.rowType);
}