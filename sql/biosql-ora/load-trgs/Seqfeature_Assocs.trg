--
-- SQL script to create the trigger(s) enabling the load API for
-- SGLD_Seqfeature_Assocs.
--
-- Scaffold auto-generated by gen-api.pl.
--
--
-- $Id: Seqfeature_Assocs.trg,v 1.1.1.1 2002-08-13 19:51:10 lapp Exp $
--

--
-- (c) Hilmar Lapp, hlapp at gnf.org, 2002.
-- (c) GNF, Genomics Institute of the Novartis Research Foundation, 2002.
--
-- You may distribute this module under the same terms as Perl.
-- Refer to the Perl Artistic License (see the license accompanying this
-- software package, or see http://www.perl.com/language/misc/Artistic.html)
-- for the terms under which you may use, modify, and redistribute this module.
-- 
-- THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED
-- WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
-- MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
--

CREATE OR REPLACE TRIGGER BIUR_Seqfeature_Assocs
       INSTEAD OF INSERT OR UPDATE
       ON SGLD_Seqfeature_Assocs
       REFERENCING NEW AS new OLD AS old
       FOR EACH ROW
DECLARE
	pk		SG_SEQFEATURE_ASSOC.SRC_FEA_OID##FIXME##TGT_FEA_OID##FIXME##ONT_OID%TYPE DEFAULT :new.FeaA_Oid;
	do_DML		INTEGER DEFAULT BSStd.DML_NO;
BEGIN
	IF INSERTING THEN
		do_DML := BSStd.DML_I;
	ELSE
		-- this is an update
		do_DML := BSStd.DML_UI;
	END IF;
	-- do insert or update (depending on whether it exists or not)
	pk := FeaA.get_oid(
			FeaA_SRC_FEA_OID##FIXME##TGT_FEA_OID##FIXME##ONT_OID => pk,
		        FeaA_TGT_FEA_OID => TGT_FEA_OID_,
			FeaA_ONT_OID => ONT_OID_,
			FeaA_RANK => FeaA_RANK,
			do_DML             => do_DML);
END;
/