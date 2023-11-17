# tcping

tcping is like [tcping.exe](https://elifulkerson.com/projects/tcping.php), but written with Golang.
fork from https://github.com/cloverstd/tcping

## build
make or make release

## Usage

- The default count of ping is 4.

- If the port is omitted, the default port is 80.

- The default interval of ping is 1s.

- The default timeout of ping is 1s.

### ping tcp

```bash
└─$ ./tcping baidu.com 443 
Ping tcp://baidu.com:443(39.156.66.10:443) connected - time=151.394614ms dns=107.687981ms jitter=0s
Ping tcp://baidu.com:443(39.156.66.10:443) connected - time=69.156501ms dns=20.85575ms jitter=82.238113ms
Ping tcp://baidu.com:443(39.156.66.10:443) connected - time=60.164854ms dns=14.651707ms jitter=8.991647ms
Ping tcp://baidu.com:443(39.156.66.10:443) connected - time=69.666633ms dns=18.314209ms jitter=9.501779ms

Ping statistics tcp://baidu.com:443
        4 probes sent.
        4 successful, 0 failed.
Approximate trip times:
        MinDuration = 60.164854ms, MaxDuration = 151.394614ms, AvgDuration = 87.59565ms 
        MinJitter = 8.991647ms, MaxJitter = 82.238113ms, AvgJitter = 20.146307ms
```

### ping http

```bash
tcping https://hui.lu
Ping https://hui.lu:443(101.133.156.52) connected - time=782.717801ms dns=300.020281ms jitter=0s bytes=64974 status=200
Ping https://hui.lu:443(101.133.156.52) connected - time=453.8989ms dns=730.17µs jitter=328.818901ms bytes=64974 status=200
Ping https://hui.lu:443(101.133.156.52) connected - time=336.031296ms dns=25.018638ms jitter=117.867604ms bytes=64974 status=200
Ping https://hui.lu:443(101.133.156.52) connected - time=283.671321ms dns=922.23µs jitter=52.359975ms bytes=64974 status=200

Ping statistics https://hui.lu:443
        4 probes sent.
        4 successful, 0 failed.
Approximate trip times:
        MinDuration = 283.671321ms, MaxDuration = 782.717801ms, AvgDuration = 464.079829ms 
        MinJitter = 52.359975ms, MaxJitter = 328.818901ms, AvgJitter = 99.809296ms
```
