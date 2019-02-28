-- Testscript voor DBS2 Opdracht 1B
-- Globalisering van studentnummers
-- Auteur: Nico Kuijpers (KRS)
-- Datum: 30 april 2015
SET SERVEROUTPUT ON
BEGIN
  ASSERT_EQUALS(checkForCorrectness('NL 4633 4809 KTU'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 4954 2537 7808 MSM'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 8051 5891 4351 NBU'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 0346 7021 0 OU'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 1483 5380 9 PTHU'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 8838 4630 6 RUG'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 0520 3256 8940 RUN'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 4755 8038 7646 RUR'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 9258 7513 6 TIAS'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 5663 9350 540 TIU'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 0161 4530 10 TUA'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 6358 9764 150 TUD'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 4528 9748 456 TUE'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 9762 6150 TUK'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 6634 7173 0 UCR'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 2735 6509 1355 UL'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 2045 2808 14 UM'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 6341 6170 3 UT'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 0440 2982 10 UU'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 7246 8587 8923 UVA'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 1714 3453 UVH'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 2487 5959 114 VU'),1);
  ASSERT_EQUALS(checkForCorrectness('NL 1087 6196 1850 WUR'),1);
END;