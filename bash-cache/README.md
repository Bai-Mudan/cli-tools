# minute_cache

`minute_cache` is a bash script to cache command outputs for 1 minute.

## Usage 

```sh
minute_cache <command>
```
To cache a command that includes shell operations like redirection or chaining, wrap it with `bash -c`:  
```sh
minute_cache bash -c "echo Hello && sleep 1 > out.txt"
```

## Notes

This is naive but portable cache implementation:

- Cache lifetime is fixed to 1 minute.
- No locking, no concurrency protection.
- Stores cache files in `/tmp/cache_store`


Feel free to open a pull request if you have improvements or ideas.