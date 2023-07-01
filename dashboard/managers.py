# from django.core.validators import FileExtensionValidator
# from django.contrib.auth.base_user import BaseUserManager


# class UserManager(BaseUserManager):
#     def create_user(self, email, password=None):
#         if not email:
#             raise ValueError('Users must have an email address')

#         email = self.normalize_email(email)
#         student = self.model(email=email)
#         student.set_password(password)
#         student.save(using=self._db)
#         return student

#     def create_superuser(self, email, password):
#         user = self.create_user(
#             email,
#             password=password,
#         )
#         user.is_admin = True
#         user.save(using=self._db)
#         return user
