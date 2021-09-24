export SECRET_KEY_BASE=9b105df354fd3949ed32a8da6a73a398b490acbedef23e7a1777b85837febf8c1c89723011efec9925f6f3493c416e69894af1ba16c28f0e06422bc233270ec2
export RAILS_SERVE_STATIC_FILES=true

rm -R "tmp"
rm -R "public/assets"
RAILS_ENV=production rails db:migrate:reset DISABLE_DATABASE_ENVIRONMENT_CHECK=1
RAILS_ENV=production rails db:seed
RAILS_ENV=production rails assets:precompile

rails server --environment production