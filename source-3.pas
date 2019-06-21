PROGRAM GAUSS;
USES CRT;
TYPE 
	MATRIZ=ARRAY[1..10,1..10] OF REAL;
	PROCEDURE LlenarMatriz(VAR M:MATRIZ;L:INTEGER);
		VAR I,J:INTEGER;
	BEGIN
		I:=0; J:=0;
		FOR I:= 1 TO L DO
			FOR J:=1 TO L DO
			BEGIN
				WRITE('[',I,',',J,'] = ');   READLN(M[I,J]);
			END;
	END;
	PROCEDURE MostrarMatriz(VAR M:MATRIZ;L:INTEGER);
		VAR I,J:INTEGER;
	BEGIN
		I:=0; J:=0;
		FOR I:=1 TO L DO
      BEGIN
			FOR J:=1 TO L DO
				WRITE(M[I,J]:5:1,'   ');
         WRITELN;
      END;
	END;
	PROCEDURE Pivote(VAR M:MATRIZ; L:INTEGER);
		VAR I,J:INTEGER;
	BEGIN
		I:=0;   J:=0;
		FOR I:=1 TO L DO
			FOR J:=1 TO L DO
            IF(M[I,I] <> 0) THEN
				  M[I,J]:= M[I,J] / M[I,I]
            ELSE
               M[I,J]:= M[I,J] + 1;
	END;

	PROCEDURE Ceros(VAR M:MATRIZ; L:INTEGER);
		VAR I,J,K:INTEGER;
	BEGIN
		I:=0;   J:=0;   K:=0;
		FOR I:=1 TO L DO
			FOR J:=1 TO L DO
				IF(I<>J) THEN
					FOR K:=1 TO L DO
						M[J,K]:= M[J,K] + M[I,K] * M[J,I] * -1;
	END;
VAR OP,N,K,L: INTEGER ;
 	 A: MATRIZ;
BEGIN
   RANDOMIZE;
   OP:=0;N:=0; K:=0;   L:=0;
	OP:= -1;


	WRITE('Introduzca longitud de la matriz A[1..20]: ');   READLN(N);
	{
   FOR K:=1 TO N DO
      FOR L:=1 TO N DO
      BEGIN
         IF (K <> L) THEN
         BEGIN

            A[K,L]:= RANDOM(100);
         END
         ELSE
            A[K,L]:= 1;
      END;
   }
   FOR K:=1 TO N DO
      FOR L:=1 TO N DO
         A[K,L]:= RANDOM(10);

	WHILE OP<>0 DO 
	BEGIN
		CLRSCR;
		WRITE( '   Menu de Gauss Jordan ');
		WRITELN;WRITELN;
		WRITELN('   1. Llena Matriz.');
		WRITELN('   2. Mostrar Matiz');
		WRITELN('   3. Colocar 0 en '+#160+'reas inferior y superior de la diagonal principal.');
		WRITELN('   4. Colocar 1 en la diagonal principal.');
		WRITELN('   5. Acci'+#162+'n 3 y 4.');
		WRITELN('   7. Cambiar longitud de matriz.');
		WRITELN('   0. Salir. ');WRITELN;WRITELN;
		WRITE('   Ingrese acci'+#162+'n: ');
		READLN( OP );

		Case OP of
			1: LlenarMatriz(A, N);
			2: MostrarMatriz(A, N);
			3: Ceros(A,N);
			4: Pivote(A,N);
			5:
			BEGIN
				Pivote(A,N);
				Ceros(A,N);
			END;
			7: 
			BEGIN	
				WRITE('Ingresar nueva longitud [1..20, 1..20]: ');
				READLN(N);
			END;
		END;
		IF (OP<> 0) THEN 
			READLN;
	END;
 READKEY;
END.
