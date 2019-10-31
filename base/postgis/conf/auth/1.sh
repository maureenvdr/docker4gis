#!/bin/bash
set -e

pushd schema/1

# current_setting('app.jwt_secret')
# needs at least 32 characters
jwt_secret="$(pg.sh -c 'select gen_random_uuid()' -At).$(pg.sh -c 'select gen_random_uuid()' -At)"
pg.sh -c "ALTER DATABASE ${POSTGRES_DB} SET app.jwt_secret TO '${jwt_secret}'"

pg.sh -f jwt_token.sql
pg.sh -f fn_jwt_time.sql
pg.sh -f fn_jwt_token.sql

pg.sh -f roles.sql
pg.sh -f tbl_users.sql
pg.sh -f fn_new_user.sql
pg.sh -f fn_user_role.sql
pg.sh -f fn_change_password.sql
pg.sh -f fn_save_password.sql

popd
