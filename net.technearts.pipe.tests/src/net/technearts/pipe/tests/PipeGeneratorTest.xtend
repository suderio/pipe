package net.technearts.pipe.tests

import com.google.inject.Inject
import net.technearts.pipe.pipe.Model
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.extensions.InjectionExtension
import org.eclipse.xtext.testing.util.ParseHelper
import org.eclipse.xtext.testing.validation.ValidationTestHelper
import org.eclipse.xtext.xbase.testing.CompilationTestHelper
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.^extension.ExtendWith

@ExtendWith(InjectionExtension)
@InjectWith(PipeInjectorProvider)
class PipeGeneratorTest {
	@Inject extension ParseHelper<Model>
	@Inject extension ValidationTestHelper
	@Inject extension CompilationTestHelper

	@Test
	def void basicGenerationTest() {
		'''
			a: 1
		'''.assertCompilesTo('''
			element
		''')
	}
}
