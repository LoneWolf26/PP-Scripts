#! /usr/bin/env python

import argparse, os
ap = argparse.ArgumentParser()
ap.add_argument("TMPLFILE")
ap.add_argument("PTFILE")
ap.add_argument("RANGE", nargs="?", default=None)
ap.add_argument("--nmin", dest="NMIN", type=int, default=None)
ap.add_argument("--nmax", dest="NMAX", type=int, default=None)
ap.add_argument("-o", "--outdir", dest="OUTDIR", default=".")
ap.add_argument("--offset", dest="OFFSET", type=int, default=10000)
args = ap.parse_args()

if args.RANGE:
    minmax = [int(x) for x in args.RANGE.split("..")]
    args.NMIN = minmax[0]
    args.NMAX = minmax[1]

tmplbase, tmplext = os.path.splitext(os.path.basename(args.TMPLFILE).replace(".tmpl", ""))
with open(args.TMPLFILE) as f:
    tmpl = f.read()

with open(args.PTFILE) as f:
    for i, line in enumerate(f):
        if args.NMIN and i < args.NMIN:
            continue
        if args.NMAX and i > args.NMAX:
            break
        ipt = i + args.OFFSET
        m1, m2, mu, tanB = [float(x) for x in line.strip().split()]
        s = tmpl.format(IPT=ipt, M1=m1, M2=m2, MU=mu, TANB=tanB)
        outname = "{0}-{1:05d}{2}".format(tmplbase, ipt, tmplext)
        with open(os.path.join(args.OUTDIR, outname), "w") as of:
            of.write(s)
