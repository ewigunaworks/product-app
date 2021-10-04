# Product Apps
## Instructions
1. Bundle Install first
2. Run setup database script
```bash
rails db:setup
```
3. run migration script
```bash
rails db:migrate
```
4. run seeding script
```bash
rails db:seed
```
5. Don't forget to run Sidekiq server and redis
```bash
sudo systemctl start redis-server
```
```bash
bundle exec sidekiq
```
6. Run the apps
```bash
rails s
```

## Collection
The postman collection attached on project 
```product-app.postman_collection.json ```