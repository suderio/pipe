package net.technearts.pipe.tests

import com.google.inject.Inject
import net.technearts.pipe.pipe.Model
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.extensions.InjectionExtension
import org.eclipse.xtext.testing.util.ParseHelper
import org.eclipse.xtext.testing.validation.ValidationTestHelper
import org.junit.Ignore
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.^extension.ExtendWith

@ExtendWith(InjectionExtension)
@InjectWith(PipeInjectorProvider)
class PipeValidationTest {
	@Inject extension ParseHelper<Model>
	@Inject extension ValidationTestHelper

	@Test
	def void testFilenames() {
		'''
		\\c\test\filename
		\\bin\filename.txt
		\\some.dir\somefile.ext
		\\a\b_c_d\f.g
		\\.\xpto
		\\..\..\..\xpto
		'''.parse.assertNoErrors
	}

	@Test //TODO
	def void testInvalidFile() {
		'''
			\\.....\test
		'''.parse.assertNoErrors
		// assertError(PipePackage.eINSTANCE.fileConstant, PipeValidator.INVALID_FILE_NAME)
	}

}
