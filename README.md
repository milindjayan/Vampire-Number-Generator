
# Vampirelast

Objective of the project is to use Elixir with the actor model to print the vampire numbers and its fangs within the provided range as input.

Vampire numbers are composite natural numbers having even number of digits that can be factored into two natural numbers having exactly half of number of digits as the original number. These factors are called fangs. Both the fangs can not have trailing zeros at the same time. Both the fangs contain precisly all the digits of original number, in any order, counting multiplicity. Example: 2187 has fangs 27 and 81.

1. Group Members:

  UFID: 81689617 Milind Jayan
  UFID: 55131139 Vivek Kumar Singh

2. We have kept the number of workers as equak to the number of cores of the system.       This decision was reached so that each core of the system would work on a different     chunk of the input range. The number of workers created in this case is 8.

3. The 8 workers would divide the work equally from the input range. The size of the       work unit in our case would be the total input range divided into chunks which          depend on the number of cores in the system

4. Result of running the command mix run vampirelast.exs 100000 200000 is below
190260 210 906 
192150 210 915
193257 327 591
193945 395 491
197725 275 719
175329 231 759
180225 225 801
180297 201 897
182250 225 810
182650 281 650
186624 216 864
162976 176 926
163944 396 414
172822 221 782
173250 231 750
174370 371 470
150300 300 501
152608 251 608
152685 261 585
153436 356 431
156240 240 651
156289 269 581
156915 165 951
140350 350 401
145314 351 414
146137 317 461
146952 156 942
125248 152 824
125433 231 543
125460 204 615 246 510
125500 251 500
126027 201 627
126846 261 486
129640 140 926
129775 179 725
131242 311 422
132430 323 410
133245 315 423
134725 317 425
135828 231 588
135837 351 387
136525 215 635
136948 146 938
115672 152 761
116725 161 725
117067 167 701
118440 141 840
120600 201 600
123354 231 534
124483 281 443
102510 201 510
104260 260 401
105210 210 501
105264 204 516
105750 150 705
108135 135 801
110758 158 701

5. Running time for above command is below
real    0m0.683s
user    0m3.251s
sys     0m0.152s

The CPU time to REAL time for the above command is 4.98

6. The larget input we were able to provide and get result is 1 to 1000000
   The largest vampire number in this range is 939658 whose fangs are 953 986 

7.

The ration of CPU time to REAL time comuted as (user+sys)/real = 4.194

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `vampirelast` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:vampirelast, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/vampirelast](https://hexdocs.pm/vampirelast).

