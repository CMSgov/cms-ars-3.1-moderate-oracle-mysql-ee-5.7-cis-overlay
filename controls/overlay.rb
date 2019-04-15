#encoding: utf-8
include_controls 'oracle-mysql-ee-5.7-cis-baseline' do
  control '7,6' do
    tag 'audit text': 'Execute the following SQL statements to assess this recommendation:
    SHOW VARIABLES LIKE \'validate_password%\';

    The result set from the above statement should show:
 
   validate_password_length should be 15 or more
    validate_password_mixed_case_count should be 1 or more
    validate_password_number_count should be 1 or more
    validate_password_special_char_count should be 1 or more
    validate_password_policy should be MEDIUM or STRONG

    The following lines should be present in the global configuration:

    plugin-load=validate_password.so 
    validate-password=FORCE_PLUS_PERMANENT

    Check if users have a password which is identical to the username:

    * the Password field is now called authentication_string
    SELECT User,authentication_string,Host FROM mysql.user
    WHERE authentication_string=CONCAT(\'*\', UPPER(SHA1(UNHEX(SHA1(user)))));

    NOTE: This method is only capable of checking the post-4.1 password format which 
    is also known as mysql_native_password.'
    
    tag 'fix': 'Add to the global configuration:
 
    plugin-load=validate_password.so 
    validate-password=FORCE_PLUS_PERMANENT
    validate_password_length=15 
    validate_password_mixed_case_count=1 
    validate_password_number_count=1 
    validate_password_special_char_count=1 
    validate_password_policy=MEDIUM

    And change passwords for users which have passwords which are identical to their username.'
  end
end
