
### User configuration
1. python -c "import sha;from base64 import b64encode;print b64encode(sha.new('my_password').digest())"

2. create a file on the go_server /path/to/file.

3. In the configuration specify the path to the file created like below:

```
<security>
  <passwordFile path="/var/tmp/passwd" />
</security>
```

4. Subsequently, the users can be created by adding the users and roles as follows:

```
<server>
  <security>
    <passwordFile path="/var/tmp/passwd" />
    <roles>
      <role name="admin">
        <users>
          <user>fred.bloggs</user>
          <user>jim.smith</user>
        </users>
      </role>
    <roles>
  </security>
</server>
```

5. Finally, the hashed password and the username is stored in the file created as <username>:<hased_password>.
This file will act as the place holder for user credentials.

6. You can create users using gocd API. the format is below:

```
curl -L --insecure 'https://<go_server>:8154/go/api/users' \
      -u 'fred.bloggs:admin' \
      -H 'Accept: application/vnd.go.cd.v1+json' \
      -H 'Content-Type: application/json' \
      -X POST \
      -d '{
            "email": "foobar@example.com",
            "login_name": "foo",
            "password": "bar"
          }'

```
